import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinger/widgets/common/transparent_gradient_box.dart';

class ScrollEdgeGradient extends StatefulWidget {
  final Widget Function(ScrollController) builder;
  final Color color;
  final double extentThreshold;
  final bool bottom;
  final bool top;

  const ScrollEdgeGradient({
    Key key,
    @required this.builder,
    @required this.color,
    this.extentThreshold = 48.0,
    this.bottom = true,
    this.top = true,
  }) : super(key: key);

  @override
  _ScrollEdgeGradientState createState() => _ScrollEdgeGradientState();
}

class _ScrollEdgeGradientState extends State<ScrollEdgeGradient> {
  ScrollController _scroller;
  ValueNotifier<ScrollExtent> _extent;

  @override
  void initState() {
    super.initState();
    _extent = ValueNotifier(null);
    _scroller = ScrollController()..addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
  }

  @override
  void dispose() {
    _scroller
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    _extent.value = ScrollExtent(
      _scroller.position.extentBefore,
      _scroller.position.extentAfter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      widget.builder(_scroller),
      if (widget.top) _buildGradient(AxisDirection.down),
      if (widget.bottom) _buildGradient(AxisDirection.up),
    ]);
  }

  Widget _buildGradient(AxisDirection direction) {
    final isTop = direction == AxisDirection.down;
    return ValueListenableBuilder<ScrollExtent>(
      valueListenable: _extent,
      builder: (_, value, __) => IgnorePointer(
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
