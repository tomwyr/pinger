import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ClipBox extends StatelessWidget {
  const ClipBox({
    Key? key,
    this.width,
    this.height,
    required this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: BoxClipper(width, height),
      child: child,
    );
  }
}

class BoxClipper extends CustomClipper<Rect> {
  BoxClipper(this.width, this.height);

  final double? width;
  final double? height;

  @override
  Rect getClip(Size size) => Rect.fromLTWH(0.0, 0.0, width ?? size.width, height ?? size.height);

  @override
  bool shouldReclip(BoxClipper oldClipper) =>
      oldClipper.width != width || oldClipper.height != height;
}
