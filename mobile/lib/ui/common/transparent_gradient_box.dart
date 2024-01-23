import 'package:flutter/material.dart';

class TransparentGradientBox extends StatelessWidget {
  const TransparentGradientBox._({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    required this.beginAlignment,
    required this.endAlignment,
  });

  factory TransparentGradientBox({
    Key? key,
    required Color color,
    required AxisDirection direction,
    double size = double.infinity,
  }) =>
      TransparentGradientBox._(
        key: key,
        color: color,
        width: direction == AxisDirection.left || direction == AxisDirection.right
            ? size
            : double.infinity,
        height: direction == AxisDirection.up || direction == AxisDirection.down
            ? size
            : double.infinity,
        beginAlignment: direction == AxisDirection.up
            ? Alignment.bottomCenter
            : direction == AxisDirection.down
                ? Alignment.topCenter
                : direction == AxisDirection.left
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
        endAlignment: direction == AxisDirection.up
            ? Alignment.topCenter
            : direction == AxisDirection.down
                ? Alignment.bottomCenter
                : direction == AxisDirection.left
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
      );

  final Color color;
  final double width;
  final double height;
  final Alignment beginAlignment;
  final Alignment endAlignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TweenAnimationBuilder(
        tween: ColorTween(begin: color, end: color),
        duration: kThemeChangeDuration,
        builder: (_, dynamic value, __) => DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [value, value.withOpacity(0.0)],
              begin: beginAlignment,
              end: endAlignment,
            ),
          ),
        ),
      ),
    );
  }
}
