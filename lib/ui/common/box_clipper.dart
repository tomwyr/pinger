import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ClipBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;

  const ClipBox({
    Key? key,
    this.width,
    this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: BoxClipper(width, height),
      child: child,
    );
  }
}

class BoxClipper extends CustomClipper<Rect> {
  final double? width;
  final double? height;

  BoxClipper(this.width, this.height);

  @override
  Rect getClip(Size size) =>
      Rect.fromLTWH(0.0, 0.0, width ?? size.width, height ?? size.height);

  @override
  bool shouldReclip(BoxClipper old) =>
      old.width != width || old.height != height;
}
