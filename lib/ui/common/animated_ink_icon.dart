import 'package:flutter/material.dart';

class AnimatedInkIcon extends StatefulWidget {
  const AnimatedInkIcon({
    Key? key,
    required this.icon,
    required this.transition,
    required this.onPressed,
  }) : super(key: key);

  final AnimatedIconData icon;
  final bool transition;
  final VoidCallback onPressed;

  @override
  _AnimatedInkIconState createState() => _AnimatedInkIconState();
}

class _AnimatedInkIconState extends State<AnimatedInkIcon> with SingleTickerProviderStateMixin {
  late AnimationController _animator;

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: widget.transition ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(AnimatedInkIcon old) {
    super.didUpdateWidget(old);
    if (old.transition != widget.transition) {
      widget.transition ? _animator.forward() : _animator.reverse();
    }
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.circle,
      containedInkWell: true,
      radius: 0.0,
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedIcon(icon: widget.icon, progress: _animator),
      ),
    );
  }
}
