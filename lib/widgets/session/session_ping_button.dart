import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class SessionPingButton extends StatelessWidget {
  static final _animDuration = const Duration(milliseconds: 500);
  static final _miniSize = 40.0;
  static final _normalSize = 56.0;
  static final _spacing = 48.0;
  static final _size = Size(_miniSize + _normalSize + _spacing, _normalSize);

  final bool isExpanded;
  final IconData primaryIcon;
  final IconData secondaryIcon;
  final VoidCallback onPrimaryPressed;
  final VoidCallback onPrimaryLongPressStart;
  final VoidCallback onPrimaryLongPressEnd;
  final VoidCallback onSecondaryPressed;

  const SessionPingButton({
    Key key,
    @required this.isExpanded,
    @required this.primaryIcon,
    @required this.secondaryIcon,
    @required this.onPrimaryPressed,
    @required this.onPrimaryLongPressStart,
    @required this.onPrimaryLongPressEnd,
    @required this.onSecondaryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: _size,
      child: Stack(children: <Widget>[
        AnimatedAlign(
          duration: _animDuration,
          alignment: isExpanded ? Alignment.centerLeft : Alignment.center,
          child: _buildFloatingButton(
            mini: true,
            raised: isExpanded,
            icon: secondaryIcon,
            iconColor: R.colors.primaryLight,
            backgroundColor: R.colors.canvas,
            onTap: onSecondaryPressed,
          ),
        ),
        AnimatedAlign(
          duration: _animDuration,
          alignment: isExpanded ? Alignment.centerRight : Alignment.center,
          child: _buildFloatingButton(
            mini: false,
            raised: true,
            icon: primaryIcon,
            iconColor: R.colors.white,
            backgroundColor: R.colors.secondary,
            onTap: onPrimaryPressed,
            onLongPressStart: onPrimaryLongPressStart,
            onLongPressEnd: onPrimaryLongPressEnd,
          ),
        ),
      ]),
    );
  }

  Widget _buildFloatingButton({
    @required IconData icon,
    @required bool raised,
    @required bool mini,
    @required Color iconColor,
    @required Color backgroundColor,
    @required VoidCallback onTap,
    VoidCallback onLongPressStart,
    VoidCallback onLongPressEnd,
  }) {
    final size = mini ? 40.0 : 56.0;
    final shadowColor = raised ? R.colors.shadow : R.colors.none;
    return GestureDetector(
      onTap: onTap,
      onLongPressStart:
          onLongPressStart != null ? (_) => onLongPressStart() : null,
      onLongPressEnd: onLongPressEnd != null ? (_) => onLongPressEnd() : null,
      child: SizedBox.fromSize(
        size: Size.square(size),
        child: TweenAnimationBuilder<Color>(
          tween: ColorTween(begin: shadowColor, end: shadowColor),
          curve: Interval(raised ? 0.5 : 0.0, raised ? 1.0 : 0.5),
          duration: _animDuration,
          builder: (_, value, __) => DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(size / 2),
              boxShadow: [
                BoxShadow(
                  color: value,
                  spreadRadius: 0.5,
                  blurRadius: 4.0,
                )
              ],
            ),
            child: Icon(icon, color: iconColor),
          ),
        ),
      ),
    );
  }
}
