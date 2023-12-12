import 'package:flutter/material.dart';

class FadeOut extends StatefulWidget {
  const FadeOut({
    super.key,
    required this.duration,
    required this.visible,
    required this.child,
  });

  final Duration duration;
  final bool visible;
  final Widget child;

  @override
  State<FadeOut> createState() => _FadeOutState();
}

class _FadeOutState extends State<FadeOut> with SingleTickerProviderStateMixin {
  late AnimationController _animator;

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.visible ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(FadeOut old) {
    super.didUpdateWidget(old);
    if (old.visible != widget.visible) {
      widget.visible ? _animator.forward() : _animator.reverse();
    }
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animator,
      child: FadeTransition(
        opacity: _animator,
        child: widget.child,
      ),
    );
  }
}
