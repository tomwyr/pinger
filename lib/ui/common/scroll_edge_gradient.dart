import 'package:flutter/material.dart';
import 'package:pinger/ui/common/transparent_gradient_box.dart';

class ScrollEdgeGradient extends StatefulWidget {
  const ScrollEdgeGradient({
    Key? key,
    required this.builder,
    required this.color,
    this.extentThreshold = 48.0,
    this.start = true,
    this.end = true,
    this.axis = Axis.vertical,
    this.sliverOverlap = 0.0,
    this.controller,
  }) : super(key: key);

  final Widget Function(ScrollController?) builder;
  final Color color;
  final double extentThreshold;
  final bool start;
  final bool end;
  final Axis axis;
  final double sliverOverlap;
  final ScrollController? controller;

  @override
  State<ScrollEdgeGradient> createState() => _ScrollEdgeGradientState();
}

class _ScrollEdgeGradientState extends State<ScrollEdgeGradient> {
  final _internalController = ScrollController();
  final _extent = ValueNotifier<ScrollExtent?>(null);

  ScrollController? _scroller;
  BoxConstraints? _lastConstraints;

  @override
  void initState() {
    super.initState();
    _scroller = (widget.controller ?? _internalController)..addListener(_updateExtent);
  }

  void _updateExtent() {
    _extent.value = ScrollExtent(
      _scroller!.position.extentBefore,
      _scroller!.position.extentAfter,
    );
  }

  @override
  void dispose() {
    _internalController.dispose();
    _extent.dispose();
    super.dispose();
  }

  late Widget _content;

  void _updateContent() {
    final isVertical = widget.axis == Axis.vertical;
    _content = Stack(children: <Widget>[
      widget.builder(_scroller),
      if (widget.start) _buildGradient(isVertical ? AxisDirection.down : AxisDirection.right),
      if (widget.end) _buildGradient(isVertical ? AxisDirection.up : AxisDirection.left),
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateExtent());
  }

  @override
  Widget build(BuildContext context) {
    // Rebuild content only when constraints change because layout
    // builder is called even if they're the same for some reason.
    _lastConstraints = null;
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints != _lastConstraints) {
        _lastConstraints = constraints;
        _updateContent();
      }
      return _content;
    });
  }

  Widget _buildGradient(AxisDirection direction) {
    final isStart = direction == AxisDirection.down || direction == AxisDirection.right;
    return ValueListenableBuilder<ScrollExtent?>(
      valueListenable: _extent,
      builder: (_, value, __) => IgnorePointer(
        child: Padding(
          padding: EdgeInsets.only(top: isStart ? widget.sliverOverlap : 0.0),
          child: Align(
            alignment: _getDirectionAlignment(direction),
            child: Opacity(
              opacity: _calcOpacity(value, isStart),
              child: TransparentGradientBox(
                color: widget.color,
                direction: direction,
                size: 48.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Alignment _getDirectionAlignment(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.left:
        return Alignment.centerRight;
      case AxisDirection.up:
        return Alignment.bottomCenter;
      case AxisDirection.right:
        return Alignment.centerLeft;
      case AxisDirection.down:
        return Alignment.topCenter;
    }
  }

  double _calcOpacity(ScrollExtent? value, bool isTop) {
    if (value == null) return 0.0;
    final extent = (isTop ? value.before : value.after);
    return (extent / widget.extentThreshold).clamp(0.0, 1.0);
  }
}

class ScrollExtent {
  ScrollExtent(this.before, this.after);

  final double before;
  final double after;

  @override
  bool operator ==(other) =>
      other is ScrollExtent && other.before == before && other.after == after;

  @override
  int get hashCode => before.hashCode ^ after.hashCode;
}
