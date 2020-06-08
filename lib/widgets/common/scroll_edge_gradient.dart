import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinger/widgets/common/transparent_gradient_box.dart';

class ScrollEdgeGradient extends StatefulWidget {
  final Widget Function(ScrollController) builder;
  final Color color;
  final double extentThreshold;
  final bool bottom;
  final bool top;
  final double sliverOverlap;
  final ScrollController controller;

  const ScrollEdgeGradient({
    Key key,
    @required this.builder,
    @required this.color,
    this.extentThreshold = 48.0,
    this.bottom = true,
    this.top = true,
    this.sliverOverlap = 0.0,
    this.controller,
  }) : super(key: key);

  @override
  _ScrollEdgeGradientState createState() => _ScrollEdgeGradientState();
}

class _ScrollEdgeGradientState extends State<ScrollEdgeGradient> {
  final _internalController = ScrollController();
  final _extent = ValueNotifier<ScrollExtent>(null);

  ScrollController _scroller;
  BoxConstraints _lastConstraints;

  @override
  void initState() {
    super.initState();
    _scroller = (widget.controller ?? _internalController)
      ..addListener(_updateExtent);
  }

  void _updateExtent() {
    _extent.value = ScrollExtent(
      _scroller.position.extentBefore,
      _scroller.position.extentAfter,
    );
  }

  @override
  void dispose() {
    _internalController.dispose();
    _extent.dispose();
    super.dispose();
  }

  Widget _content;

  void _updateContent() {
    _content = Stack(children: <Widget>[
      widget.builder(_scroller),
      if (widget.top) _buildGradient(AxisDirection.down),
      if (widget.bottom) _buildGradient(AxisDirection.up),
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
    final isTop = direction == AxisDirection.down;
    return ValueListenableBuilder<ScrollExtent>(
      valueListenable: _extent,
      builder: (_, value, __) => IgnorePointer(
        child: Padding(
          padding: EdgeInsets.only(top: isTop ? widget.sliverOverlap : 0.0),
          child: Align(
            alignment: isTop ? Alignment.topCenter : Alignment.bottomCenter,
            child: Opacity(
              opacity: _calcOpacity(value, isTop),
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

  double _calcOpacity(ScrollExtent value, bool isTop) {
    if (value == null) return 0.0;
    final extent = (isTop ? value.before : value.after);
    return (extent / widget.extentThreshold).clamp(0.0, 1.0);
  }
}

class ScrollExtent {
  final double before;
  final double after;

  ScrollExtent(this.before, this.after);

  @override
  bool operator ==(other) =>
      other is ScrollExtent &&
      other != null &&
      other.before == before &&
      other.after == after;

  @override
  int get hashCode => before.hashCode ^ after.hashCode;
}
