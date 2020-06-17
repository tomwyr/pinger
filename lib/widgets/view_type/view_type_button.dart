import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class ViewTypeButton extends StatelessWidget {
  static final height = 26.0;
  
  final String label;
  final bool selected;
  final VoidCallback onPressed;

  const ViewTypeButton({
    Key key,
    @required this.label,
    @required this.selected,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(20.0);
    final color = selected ? R.colors.accent : R.colors.gray;
    return LayoutBuilder(
      builder: (_, constraints) => Container(
        height: height,
        constraints: BoxConstraints(maxWidth: min(56.0, constraints.maxWidth)),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: radius,
          color: selected ? color.withOpacity(0.33) : R.colors.none,
        ),
        child: InkResponse(
          splashColor: R.colors.none,
          highlightShape: BoxShape.rectangle,
          borderRadius: radius,
          highlightColor: color.withOpacity(0.33),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                color: selected ? R.colors.accent : R.colors.gray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
