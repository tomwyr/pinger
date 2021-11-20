import 'package:flutter/widgets.dart';

class SnappingScrollArea extends StatefulWidget {
  final int initialPosition;
  final int itemCount;
  final Widget child;
  final double itemInterval;
  final double mainAxisPadding;
  final Axis scrollDirection;
  final Duration snapDuration;
  final ValueChanged<int> onPositionChanged;

  const SnappingScrollArea({
    Key? key,
    required this.child,
    required this.itemInterval,
    required this.itemCount,
    required this.onPositionChanged,
    this.scrollDirection = Axis.horizontal,
    this.snapDuration = const Duration(milliseconds: 300),
    this.mainAxisPadding = 0.0,
    this.initialPosition = 0,
  }) : super(key: key);

  @override
  _SnappingScrollAreaState createState() => _SnappingScrollAreaState();
}

class _SnappingScrollAreaState extends State<SnappingScrollArea> {
  ScrollController? _scrollController;
  int? _snapPosition;
  bool _isSnapping = false;

  @override
  void initState() {
    super.initState();
    _snapPosition = widget.initialPosition;
    _scrollController = ScrollController(
      initialScrollOffset: _calcPositionOffset(_snapPosition!),
    );
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  bool _onScrollEnd(ScrollEndNotification notification) {
    if (!_isSnapping) {
      final relativeOffset = _scrollController!.offset +
          (widget.itemInterval - widget.mainAxisPadding) / 2;
      final num position = (relativeOffset ~/ widget.itemInterval)
          .clamp(0, widget.itemCount - 1);
      Future(() => _snapChartTo(position as int));
      if (position != _snapPosition) {
        _snapPosition = position as int?;
        widget.onPositionChanged(position as int);
      }
    }
    return true;
  }

  void _snapChartTo(int position) async {
    final offset = _calcPositionOffset(position);
    if (offset != _scrollController!.offset) {
      _isSnapping = true;
      await _scrollController!.animateTo(
        offset,
        duration: widget.snapDuration,
        curve: Curves.easeOut,
      );
      _isSnapping = false;
    }
  }

  double _calcPositionOffset(int position) =>
      position * widget.itemInterval + widget.mainAxisPadding / 2;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: _onScrollEnd,
      child: SingleChildScrollView(
        scrollDirection: widget.scrollDirection,
        controller: _scrollController,
        child: Container(
          width: (widget.itemCount - 1) * widget.itemInterval +
              2 * widget.mainAxisPadding,
          padding: EdgeInsets.symmetric(horizontal: widget.mainAxisPadding),
          child: OverflowBox(
            alignment: Alignment.centerLeft,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
