import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class SessionHostButton extends StatelessWidget {
  const SessionHostButton({
    super.key,
    required this.icon,
    required this.label,
    required this.enabled,
    required this.active,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool enabled;
  final bool active;
  final VoidCallback? onPressed;

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
              size: const Size.square(40.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                  side: BorderSide(color: color),
                  foregroundColor: color,
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
