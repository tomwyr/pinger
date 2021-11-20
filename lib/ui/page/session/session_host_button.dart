import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class SessionHostButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool enabled;
  final bool active;
  final VoidCallback? onPressed;

  const SessionHostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.enabled,
    required this.active,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = active ? R.colors.secondary : R.colors.gray;
    return Stack(children: <Widget>[
      GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size.square(40.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: CircleBorder(),
                  side: BorderSide(color: color),
                  // TODO verify how to apply colors
                  // color: color,
                  // highlightedBorderColor: color,
                  // splashColor: color.withOpacity(0.5),
                ),
                onPressed: onPressed,
                child: Icon(icon, color: color),
              ),
            ),
            Container(height: 8.0),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
      if (!enabled)
        Positioned.fill(
          child: AbsorbPointer(
            child: Container(
              color: R.colors.canvas.withOpacity(0.75),
            ),
          ),
        ),
    ]);
  }
}
