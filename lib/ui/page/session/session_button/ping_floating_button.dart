import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class PingFloatingButton extends StatelessWidget {
  final Duration duration;
  final bool raised;
  final double size;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;
  final VoidCallback onLongPressStart;
  final VoidCallback onLongPressEnd;
  final ValueChanged<double> onSwipeUpdate;
  final VoidCallback onSwipeEnd;

  const PingFloatingButton({
    Key key,
    @required this.duration,
    @required this.raised,
    @required this.size,
    @required this.icon,
    @required this.iconColor,
    @required this.backgroundColor,
    this.onTap,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onSwipeUpdate,
    this.onSwipeEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shadowColor = raised ? R.colors.shadow : R.colors.none;
    return Listener(
      onPointerMove:
          onSwipeUpdate != null ? (it) => onSwipeUpdate(it.delta.dx) : null,
      onPointerUp: onSwipeEnd != null ? (_) => onSwipeEnd() : null,
      child: GestureDetector(
        onTap: onTap,
        onLongPressStart:
            onLongPressStart != null ? (_) => onLongPressStart() : null,
        onLongPressEnd: onLongPressEnd != null ? (_) => onLongPressEnd() : null,
        child: SizedBox.fromSize(
          size: Size.square(size),
          child: TweenAnimationBuilder<Color>(
            tween: ColorTween(begin: shadowColor, end: shadowColor),
            curve: Interval(raised ? 0.5 : 0.0, raised ? 1.0 : 0.5),
            duration: duration,
            builder: (_, value, __) => DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(size / 2),
                boxShadow: [
                  BoxShadow(color: value, spreadRadius: 0.5, blurRadius: 4.0),
                ],
              ),
              child: Icon(icon, color: iconColor),
            ),
          ),
        ),
      ),
    );
  }
}
