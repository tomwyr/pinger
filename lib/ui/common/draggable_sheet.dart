import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DraggableSheetController {
  _DraggableSheetState _state;

  double get currentExpansion => _state?._currentExpansion;
  Stream<double> get expansion => _state?._expansion?.stream?.distinct();
  bool get isVisible => _state?._visibility?.value;

  void show() => _state?.show();
  void hide() => _state?.hide();
  void expand() => _state?.expand();
  void collapse() => _state?.collapse();
}

class DraggableSheet extends StatefulWidget {
  final DraggableSheetController controller;
  final Widget child;
  final WidgetBuilder handleBuilder;
  final WidgetBuilder contentBuilder;

  const DraggableSheet({
    Key key,
    @required this.handleBuilder,
    @required this.contentBuilder,
    @required this.child,
    @required this.controller,
  }) : super(key: key);

  @override
  _DraggableSheetState createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet>
    with SingleTickerProviderStateMixin {
  final _dragAnimTween = Tween<double>(begin: 0.0, end: 0.0);
  final _dragDelta = ValueNotifier(0.0);
  final _visibility = ValueNotifier(false);
  final _sheetHeight = ValueNotifier(_SheetHeight.zero);
  final _expansion = StreamController<double>.broadcast();

  AnimationController _animator;
  double _currentExpansion;
  _SheetState _sheetState;

  void show() => _visibility.value = true;
  void hide() => _visibility.value = false;
  void expand() => _animateTo(-_sheetHeight.value.content);
  void collapse() => _animateTo(0.0);

  @override
  void initState() {
    super.initState();
    _updateExpansion();
    _setupDragAnimation();
    _sheetHeight.addListener(_updateExpansion);
    _dragDelta.addListener(_updateExpansion);
    widget.controller._state = this;
  }

  @override
  void dispose() {
    widget.controller._state = null;
    _sheetHeight.removeListener(_updateExpansion);
    _dragDelta.removeListener(_updateExpansion);
    _expansion.close();
    _animator.dispose();
    super.dispose();
  }

  void _setupDragAnimation() {
    _animator = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    final animation = _dragAnimTween
        .chain(CurveTween(curve: Curves.easeOutCubic))
        .animate(_animator);
    animation
      ..addListener(() => _dragDelta.value = animation.value)
      ..addStatusListener((it) {
        if (it == AnimationStatus.completed) {
          _sheetState = animation.value == 0.0
              ? _SheetState.COLLAPSED
              : _SheetState.EXPANDED;
        }
      });
  }

  void _updateExpansion() {
    _currentExpansion =
        (-_dragDelta.value / _sheetHeight.value.content).clamp(0.0, 1.0);
    _expansion.add(_currentExpansion);
  }

  void _onDragUpdate(double delta) {
    if (!_animator.isAnimating) {
      _sheetState = _SheetState.DRAGGING;
      _dragDelta.value += delta;
    }
  }

  void _onDragEnd(double velocity) {
    if (!_animator.isAnimating) {
      _animateTo(_calcEndDelta(velocity));
    }
  }

  void _animateTo(double delta) {
    _dragAnimTween
      ..begin = _dragDelta.value
      ..end = delta;
    _sheetState = delta == 0.0 ? _SheetState.COLLAPSING : _SheetState.EXPANDING;
    _animator.forward(from: 0.0);
  }

  double _calcEndDelta(double velocity) {
    final contentHeight = _sheetHeight.value.content;
    final expand = velocity < 0.0 ||
        (velocity == 0.0 && _dragDelta.value < -contentHeight / 2);
    return expand ? -contentHeight : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      widget.child,
      _wrapWithSlideTransition(_buildSheet()),
    ]);
  }

  Widget _wrapWithSlideTransition(Widget child) {
    return ValueListenableBuilder<bool>(
      valueListenable: _visibility,
      builder: (_, value, child) => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 500),
        tween: Tween(begin: value ? 0.0 : 1.0, end: value ? 0.0 : 1.0),
        builder: (_, value, child) => FractionalTranslation(
          translation: Offset(0.0, value),
          child: child,
        ),
        child: child,
      ),
      child: child,
    );
  }

  Widget _buildSheet() {
    return GestureDetector(
      onVerticalDragUpdate: (it) => _onDragUpdate(it.delta.dy),
      onVerticalDragEnd: (it) => _onDragEnd(it.velocity.pixelsPerSecond.dy),
      onVerticalDragCancel: () => _onDragEnd(0.0),
      child: ValueListenableBuilder<double>(
        valueListenable: _dragDelta,
        builder: (_, value, __) => CustomMultiChildLayout(
          delegate: _SheetLayoutDelegate(value, _sheetState, _sheetHeight),
          children: <Widget>[
            LayoutId(
              id: _SheetItem.HANDLE,
              child: widget.handleBuilder(context),
            ),
            LayoutId(
              id: _SheetItem.CONTENT,
              child: widget.contentBuilder(context),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SheetItem { HANDLE, CONTENT }

enum _SheetState { EXPANDING, EXPANDED, COLLAPSING, COLLAPSED, DRAGGING }

class _SheetLayoutDelegate extends MultiChildLayoutDelegate {
  final double dragDelta;
  final _SheetState sheetState;
  final ValueNotifier<_SheetHeight> sheetHeight;

  _SheetLayoutDelegate(this.dragDelta, this.sheetState, this.sheetHeight);

  @override
  void performLayout(Size size) {
    final height = layoutItems(size);
    final handleOffset = _calcHandleOffset(size, height);
    final contentOffset = handleOffset + Offset(0.0, height.handle);
    positionChild(_SheetItem.HANDLE, handleOffset);
    positionChild(_SheetItem.CONTENT, contentOffset);
    sheetHeight.value = height;
  }

  _SheetHeight layoutItems(Size size) {
    final constraints = BoxConstraints(maxWidth: size.width);
    final handleHeight = layoutChild(_SheetItem.HANDLE, constraints).height;
    final contentHeight = layoutChild(_SheetItem.CONTENT, constraints).height;
    return _SheetHeight(handleHeight, contentHeight);
  }

  Offset _calcHandleOffset(Size parentSize, _SheetHeight height) {
    final heightDiff = _calcHeightDiff(height);
    final maxHeight = parentSize.height - height.handle;
    final startHeight =
        (parentSize.height - height.handle + dragDelta + heightDiff)
            .clamp(maxHeight - height.content, maxHeight)
            .ceilToDouble();
    return Offset(0.0, startHeight);
  }

  double _calcHeightDiff(_SheetHeight height) {
    final diff = sheetHeight.value - height;
    if (diff != _SheetHeight.zero) {
      return sheetState == _SheetState.COLLAPSING ||
              sheetState == _SheetState.COLLAPSED ||
              sheetState == _SheetState.DRAGGING
          ? max(diff.total, 0.0)
          : min(diff.total, 0.0);
    }
    return 0.0;
  }

  @override
  bool shouldRelayout(_SheetLayoutDelegate old) => old.dragDelta != dragDelta;
}

class _SheetHeight {
  const _SheetHeight(this.handle, this.content);
  static const zero = _SheetHeight(0.0, 0.0);

  final double handle;
  final double content;

  @override
  int get hashCode => handle.hashCode ^ content.hashCode;

  @override
  String toString() => "$_SheetHeight($handle, $content)";

  double get total => handle + content;

  _SheetHeight operator -(_SheetHeight other) =>
      _SheetHeight(handle - other.handle, content - other.content);

  @override
  bool operator ==(other) =>
      other != null &&
      other is _SheetHeight &&
      other.handle == handle &&
      other.content == content;
}
