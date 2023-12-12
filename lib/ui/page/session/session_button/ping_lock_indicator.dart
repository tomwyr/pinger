import 'dart:math';

import 'package:flutter/material.dart';

class PingLockIndicatorDimens {
  PingLockIndicatorDimens({
    this.arrowSize = const Size(8.0, 16.0),
    this.arrowCount = 4,
    this.iconSize = 18.0,
    this.iconMargin = 8.0,
  }) : totalWidth = arrowCount * arrowSize.width + iconSize + iconMargin;

  final Size arrowSize;
  final double arrowCount;
  final double iconSize;
  final double iconMargin;
  final double totalWidth;
}

class PingLockIndicator extends StatelessWidget {
  const PingLockIndicator({
    super.key,
    required this.duration,
    required this.direction,
    required this.margin,
    required this.isLocked,
    required this.color,
    required this.dimens,
    required this.swipe,
  });

  final Duration duration;
  final TextDirection direction;
  final double margin;
  final bool? isLocked;
  final ColorTween color;
  final PingLockIndicatorDimens dimens;
  final ValueNotifier<double?> swipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: direction == TextDirection.ltr ? margin : 0.0,
        right: direction == TextDirection.rtl ? margin : 0.0,
      ),
      child: AnimatedOpacity(
        duration: duration,
        opacity: isLocked != null ? 1.0 : 0.0,
        child: ValueListenableBuilder<double?>(
          valueListenable: swipe,
          builder: (_, value, __) => _buildIndicatorRow(value!),
        ),
      ),
    );
  }

  Widget _buildIndicatorRow(double value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: direction,
      children: [
        for (var i = 0; i < dimens.arrowCount; i++)
          Transform.rotate(
            angle: direction == TextDirection.ltr ? 0.0 : pi,
            child: SizedBox(
              width: dimens.arrowSize.width,
              child: Icon(
                Icons.chevron_right,
                size: dimens.arrowSize.height,
                color: _calcLockArrowColor(i, value),
              ),
            ),
          ),
        Container(width: dimens.iconMargin),
        Icon(
          Icons.lock_outline,
          size: dimens.iconSize,
          color: _calcLockIconColor(value),
        ),
      ],
    );
  }

  Color? _calcLockArrowColor(int index, double value) {
    return color.transform(Interval(
      index / (dimens.arrowCount + 1),
      (index + 1) / (dimens.arrowCount + 1),
    ).transform(value));
  }

  Color? _calcLockIconColor(double value) {
    return color.transform(Interval(
      dimens.arrowCount / (dimens.arrowCount + 1),
      1.0,
    ).transform(value));
  }
}
