import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DraggableSheetController {
  _DraggableSheetState? _state;

  SheetState? get sheetState => _state?._sheetState;
  double? get currentExpansion => _state?._currentExpansion;
  Stream<double?>? get expansion => _state?._expansion.stream.distinct();
  bool? get isVisible => _state?._visibility.value;

  void show() => _state?.show();
  void hide() => _state?.hide();
  void expand() => _state?.expand();
  void collapse() => _state?.collapse();
}

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({
    Key? key,
    required this.controller,
    required this.duration,
    required this.child,
    required this.handleBuilder,
    required this.contentBuilder,
  }) : super(key: key);

  final DraggableSheetController controller;
  final Duration duration;
  final Widget? child;
  final WidgetBuilder handleBuilder;
  final WidgetBuilder contentBuilder;

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> with SingleTickerProviderStateMixin {
  final _dragAnimTween = Tween<double>(begin: 0.0, end: 0.0);
  final _dragDelta = ValueNotifier(0.0);
  final _visibility = ValueNotifier(false);
  final _sheetHeight = ValueNotifier(_SheetHeight.zero);
  final _expansion = StreamController<double?>.broadcast();

  SheetState _sheetState = SheetState.collapsed;
  _SheetHeight _lastHeight = _SheetHeight.zero;
  late AnimationController _animator;
  double? _currentExpansion;
  double? _lastAnimValue;

  late Widget _handle;
  late Widget _content;
  BoxConstraints? _lastSheetConstraints;

  void show() => _visibility.value = true;
  void hide() => _visibility.value = false;
  void expand() => _animateTo(-_sheetHeight.value.content);
  void collapse() => _animateTo(0.0);

  @override
  void initState() {
    super.initState();
    _updateExpansion();
    _setupDragAnimation();
    _sheetHeight.addListener(_onSheetHeight);
    _dragDelta.addListener(_onDragDelta);
    widget.controller._state = this;
  }

  @override
  void dispose() {
    widget.controller._state = null;
    _sheetHeight.removeListener(_onSheetHeight);
    _dragDelta.removeListener(_onDragDelta);
    _expansion.close();
    _animator.dispose();
    super.dispose();
  }

  void _setupDragAnimation() {
    _animator = AnimationController(vsync: this, duration: widget.duration);
    final animation =
        _dragAnimTween.chain(CurveTween(curve: Curves.easeOutCubic)).animate(_animator);
    animation
      ..addListener(() {
        _dragDelta.value += (animation.value - (_lastAnimValue ?? 0.0));
        _lastAnimValue = animation.value;
      })
      ..addStatusListener((it) {
        if (it == AnimationStatus.completed) {
          _lastAnimValue = null;
          _sheetState = _dragDelta.value == 0.0 ? SheetState.collapsed : SheetState.expanded;
        }
      });
  }

  void _onSheetHeight() {
    if (_sheetState == SheetState.expanded || _sheetState == SheetState.expanding) {
      final heightDiff = (_lastHeight - _sheetHeight.value).total;
      Future(() => _dragDelta.value += heightDiff);
    } else {
      _updateExpansion();
    }
    _lastHeight = _sheetHeight.value;
  }

  void _onDragDelta() => _updateExpansion();

  void _updateExpansion() {
    final contentHeight = _sheetHeight.value.content;
    _currentExpansion =
        contentHeight > 0.0 ? (-_dragDelta.value / contentHeight).clamp(0.0, 1.0) : 0.0;
    _expansion.add(_currentExpansion);
  }

  void _onDragUpdate(double delta) {
    if (!_animator.isAnimating) {
      _sheetState = SheetState.dragging;
      _dragDelta.value = (_dragDelta.value + delta).clamp(-_sheetHeight.value.content, 0.0);
    }
  }

  void _onDragEnd(double velocity) {
    if (!_animator.isAnimating) {
      final endDelta = _calcEndDelta(velocity);
      final didReachEnd = endDelta == 0.0 ? _dragDelta.value >= 0.0 : _dragDelta.value <= endDelta;
      if (didReachEnd) {
        _dragDelta.value = endDelta;
        _sheetState = endDelta == 0.0 ? SheetState.collapsed : SheetState.expanded;
      } else {
        _animateTo(endDelta);
      }
    }
  }

  double _calcEndDelta(double velocity) {
    final contentHeight = _sheetHeight.value.content;
    final expand = velocity < 0.0 || (velocity == 0.0 && _dragDelta.value < -contentHeight / 2);
    return expand ? -contentHeight : 0.0;
  }

  void _animateTo(double delta) {
    if (delta != _dragDelta.value) {
      _dragAnimTween
        ..begin = 0.0
        ..end = delta - _dragDelta.value;
      _sheetState = _dragAnimTween.end! > 0 ? SheetState.collapsing : SheetState.expanding;
      _animator.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      widget.child!,
      _wrapWithSlideTransition(_buildSheet()),
    ]);
  }

  Widget _wrapWithSlideTransition(Widget child) {
    return ValueListenableBuilder<bool>(
      valueListenable: _visibility,
      builder: (_, value, child) => TweenAnimationBuilder<double>(
        duration: widget.duration,
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
        builder: (_, value, __) => LayoutBuilder(
          builder: (_, constraints) {
            if (_lastSheetConstraints != constraints) {
              _lastSheetConstraints = constraints;
              _handle = widget.handleBuilder(context);
              _content = widget.contentBuilder(context);
            }
            return CustomMultiChildLayout(
              delegate: _SheetLayoutDelegate(value, _sheetState, _sheetHeight),
              children: <Widget>[
                LayoutId(id: _SheetItem.handle, child: _handle),
                LayoutId(id: _SheetItem.content, child: _content),
              ],
            );
          },
        ),
      ),
    );
  }
}

enum _SheetItem { handle, content }

enum SheetState { expanding, expanded, collapsing, collapsed, dragging }

class _SheetLayoutDelegate extends MultiChildLayoutDelegate {
  _SheetLayoutDelegate(this.dragDelta, this.sheetState, this.sheetHeight);

  final double dragDelta;
  final SheetState sheetState;
  final ValueNotifier<_SheetHeight> sheetHeight;

  @override
  void performLayout(Size size) {
    final height = layoutItems(size);
    final contentOffset = (size.height + dragDelta + _calcHeightDiff(height))
        .clamp(size.height - height.content, size.height);
    final handleOffset = contentOffset - height.handle;
    positionChild(_SheetItem.content, Offset(0.0, contentOffset));
    positionChild(_SheetItem.handle, Offset(0.0, handleOffset));
    sheetHeight.value = height;
  }

  _SheetHeight layoutItems(Size size) {
    final constraints = BoxConstraints(maxWidth: size.width);
    final handleHeight = layoutChild(_SheetItem.handle, constraints).height;
    final contentHeight = layoutChild(_SheetItem.content, constraints).height;
    return _SheetHeight(handleHeight, contentHeight);
  }

  double _calcHeightDiff(_SheetHeight height) {
    final diff = sheetHeight.value - height;
    if (diff != _SheetHeight.zero) {
      return sheetState == SheetState.expanding || sheetState == SheetState.expanded
          ? min(diff.total, 0.0)
          : max(diff.total, 0.0);
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
      other is _SheetHeight && other.handle == handle && other.content == content;
}

class SeparatedDraggableSheet<T> extends StatefulWidget {
  const SeparatedDraggableSheet({
    Key? key,
    required this.controller,
    required this.duration,
    required this.animateVisibility,
    required this.child,
    required this.items,
    required this.onVisibilityChanged,
    required this.handleBuilder,
    required this.separatorBuilder,
    required this.contentBuilder,
  }) : super(key: key);

  final DraggableSheetController controller;
  final Duration duration;
  final bool animateVisibility;
  final Widget? child;
  final List<SeparatedItem<T>> items;
  final ValueChanged<Set<T>> onVisibilityChanged;
  final WidgetBuilder handleBuilder;
  final WidgetBuilder separatorBuilder;
  final Widget Function(BuildContext, List<Widget>) contentBuilder;

  @override
  State<SeparatedDraggableSheet<T>> createState() => _SeparatedDraggableSheetState<T>();
}

class _SeparatedDraggableSheetState<T> extends State<SeparatedDraggableSheet<T>> {
  final _visibleItems = <T>{};
  final _separatorVisibilities = <T, ValueNotifier<bool?>>{};
  final _visibilityListeners = <T, VoidCallback>{};

  late List<SeparatedItem<T>> _items;
  T? _firstVisibleItem;

  @override
  void initState() {
    super.initState();
    _items = widget.items
      ..forEach((it) {
        void listener() => _onItemVisibility(it.value, it.visibility.value!);

        _separatorVisibilities[it.value] = ValueNotifier(it.visibility.value);
        _visibilityListeners[it.value] = listener;
        it.visibility.addListener(listener);
        Future(listener);
      });
  }

  @override
  void dispose() {
    for (var it in _items) {
      it.visibility.removeListener(_visibilityListeners[it.value]!);
      _separatorVisibilities[it.value]!.dispose();
    }
    super.dispose();
  }

  void _onItemVisibility(T item, bool visible) {
    final didChange = visible ? _visibleItems.add(item) : _visibleItems.remove(item);
    if (didChange) {
      visible ? _onItemAppeared(item) : _onItemDisappeared(item);
      widget.onVisibilityChanged(_visibleItems);
    }
  }

  void _onItemAppeared(T item) {
    if (_findFirstVisibltItem() == item) {
      if (_firstVisibleItem != null) {
        _separatorVisibilities[_firstVisibleItem!]!.value = true;
      }
      _firstVisibleItem = item;
      _separatorVisibilities[item]!.value = false;
    } else {
      _separatorVisibilities[item]!.value = true;
    }
  }

  void _onItemDisappeared(T item) {
    if (_firstVisibleItem == item) {
      _firstVisibleItem = _findFirstVisibltItem();
      if (_firstVisibleItem != null) {
        _separatorVisibilities[_firstVisibleItem!]!.value = false;
      }
    } else {
      _separatorVisibilities[item]!.value = false;
    }
  }

  T? _findFirstVisibltItem() => _visibleItems.isNotEmpty
      ? _items.firstWhere((it) => _visibleItems.contains(it.value)).value
      : null;

  @override
  Widget build(BuildContext context) {
    return DraggableSheet(
      controller: widget.controller,
      duration: widget.duration,
      handleBuilder: widget.handleBuilder,
      contentBuilder: (context) => widget.contentBuilder(
        context,
        [
          for (var it in _items) ...[
            _buildSheetItem(
              _separatorVisibilities[it.value]!,
              widget.separatorBuilder(context),
            ),
            _buildSheetItem(
              it.visibility,
              it.builder(context),
            ),
          ]
        ],
      ),
      child: widget.child,
    );
  }

  Widget _buildSheetItem(ValueNotifier<bool?> visibility, Widget child) {
    return ValueListenableBuilder<bool?>(
      valueListenable: visibility,
      builder: (_, value, child) => widget.animateVisibility
          ? AnimatedSwitcher(
              duration: widget.duration,
              transitionBuilder: (child, animation) => SizeTransition(
                sizeFactor: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
              child: value! ? child : const SizedBox.shrink(),
            )
          : Visibility(visible: value!, child: child!),
      child: child,
    );
  }
}

class SeparatedItem<T> {
  SeparatedItem({
    required this.value,
    required this.visibility,
    required this.builder,
  });

  final T value;
  final ValueNotifier<bool?> visibility;
  final WidgetBuilder builder;
}
