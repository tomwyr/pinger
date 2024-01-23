import 'dart:math';

import 'package:flutter/material.dart';

class ThreeBounce extends StatefulWidget {
  const ThreeBounce({
    super.key,
    this.color,
    this.size = 48.0,
    this.duration = const Duration(milliseconds: 1500),
  });

  final Color? color;
  final double size;
  final Duration duration;

  @override
  State<ThreeBounce> createState() => _ThreeBounceState();
}

class _ThreeBounceState extends State<ThreeBounce> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 2, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, _buildDot),
        ),
      ),
    );
  }

  Widget _buildDot(index) {
    return ScaleTransition(
      scale: DelayTween(
        begin: 0.0,
        end: 1.0,
        delay: index * 0.2,
      ).animate(_controller),
      child: SizedBox.fromSize(
        size: Size.square(widget.size * 0.5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  DelayTween({
    required double begin,
    required double end,
    required this.delay,
  }) : super(begin: begin, end: end);

  final double? delay;

  @override
  double lerp(double t) => super.lerp((sin((t - delay!) * 2 * pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
