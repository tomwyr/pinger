import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinger/ui/common/box_clipper.dart';

class CollapsingHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double topItemMaxExtent;
  final double topItemExtent;
  final double topItemPadding;
  final double bottomItemExtent;
  final double bottomGradientExtent;
  final Widget topItem;
  final Widget bottomItem;
  final Widget bottomGradient;
  final Color color;

  CollapsingHeaderDelegate({
    @required this.topItemExtent,
    @required this.bottomItemExtent,
    @required this.bottomGradientExtent,
    @required this.topItemPadding,
    @required this.topItem,
    @required this.bottomItem,
    @required this.bottomGradient,
    @required this.color,
  }) : topItemMaxExtent = topItemExtent + 2 * topItemPadding;

  @override
  Widget build(BuildContext context, double shrinkOffset, _) {
    final expansion = 1 - shrinkOffset / maxExtent;
    final topItemTop = topItemPadding * expansion;
    final bottomItemTop = topItemMaxExtent * expansion;
    final topItemOverflowStart =
        maxExtent * expansion - topItemTop + bottomItemExtent;
    final bottomItemEnd = bottomItemTop + bottomItemExtent;
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: 0.0,
          height: bottomItemEnd,
          left: 0.0,
          right: 0.0,
          child: Container(color: color),
        ),
        Positioned(
          top: topItemTop,
          height: topItemExtent,
          left: 0.0,
          right: 0.0,
          child: ClipBox(
            height: min(topItemExtent, topItemOverflowStart),
            child: topItem,
          ),
        ),
        Positioned(
          top: 0.0,
          height: bottomItemEnd,
          left: 0.0,
          right: 0.0,
          child: IgnorePointer(
            child: _buildTopItemGradient(expansion),
          ),
        ),
        Positioned(
          top: bottomItemTop,
          height: bottomItemExtent,
          left: 0.0,
          right: 0.0,
          child: bottomItem,
        ),
        Positioned(
          top: bottomItemEnd,
          height: bottomGradientExtent,
          left: 0.0,
          right: 0.0,
          child: bottomGradient,
        ),
      ],
    );
  }

  Widget _buildTopItemGradient(double expansion) {
    return Opacity(
      opacity: sqrt(1.0 - expansion),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [color, color.withOpacity(1.0 - expansion)],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => topItemMaxExtent + bottomItemExtent;

  @override
  double get minExtent => bottomItemExtent + bottomGradientExtent;

  @override
  bool shouldRebuild(CollapsingHeaderDelegate old) => true;
}
