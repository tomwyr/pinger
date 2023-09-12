import 'dart:math';

import 'package:flutter/material.dart';

import 'package:pinger/resources.dart';

class SessionValuesScrollable extends StatefulWidget {
  const SessionValuesScrollable({
    Key? key,
    required this.axis,
    required this.didReachHead,
    required this.shouldFollowHead,
    required this.moveToHeadValue,
    required this.child,
  }) : super(key: key);

  final Axis axis;
  final ValueNotifier<bool>? didReachHead;
  final bool shouldFollowHead;
  final Future<void> Function() moveToHeadValue;
  final Widget child;

  @override
  State<SessionValuesScrollable> createState() => _SessionValuesScrollableState();
}

class _SessionValuesScrollableState extends State<SessionValuesScrollable> {
  final _forwardButtonSize = 40.0;

  late ValueNotifier<bool> _isFollowingHead;

  @override
  void initState() {
    super.initState();
    _isFollowingHead = ValueNotifier(widget.shouldFollowHead);
  }

  @override
  void dispose() {
    _isFollowingHead.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SessionValuesScrollable old) {
    super.didUpdateWidget(old);
    final shouldFollow = widget.shouldFollowHead;
    if (old.shouldFollowHead != shouldFollow) {
      _isFollowingHead.value = shouldFollow;
      if (shouldFollow) widget.moveToHeadValue();
    }
  }

  void _onFollowPressed() async {
    _isFollowingHead.value = true;
    await widget.moveToHeadValue();
    if (!mounted) return;
    _isFollowingHead.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IgnorePointer(
        ignoring: widget.shouldFollowHead,
        child: widget.child,
      ),
      Align(
        alignment: Alignment.topRight,
        child: FractionalTranslation(
          translation: const Offset(-0.25, 0.25),
          child: GestureDetector(
            onTap: _onFollowPressed,
            child: ValueListenableBuilder<bool>(
              valueListenable: _isFollowingHead,
              builder: (_, isFollowingHead, __) => ValueListenableBuilder<bool>(
                valueListenable: widget.didReachHead!,
                builder: (_, didReachHead, __) =>
                    _buildFollowButton(!isFollowingHead && !didReachHead),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _buildFollowButton(bool isVisible) {
    final tweenTarget = isVisible ? 1.0 : 0.0;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: tweenTarget, end: tweenTarget),
      duration: const Duration(milliseconds: 500),
      builder: (_, value, __) => Opacity(
        opacity: min(1.0, value * 2),
        child: SizedBox.fromSize(
          size: Size.square(_forwardButtonSize),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: R.colors.canvas,
              borderRadius: BorderRadius.circular(_forwardButtonSize / 2),
              boxShadow: [
                BoxShadow(
                  color: ColorTween(
                    begin: R.colors.none,
                    end: R.colors.shadow,
                  ).transform(value)!,
                  spreadRadius: 1.0,
                  blurRadius: 4.0,
                )
              ],
            ),
            child: Transform.rotate(
              angle: widget.axis == Axis.vertical ? pi * 1.5 : 0.0,
              child: Icon(
                Icons.fast_forward,
                size: _forwardButtonSize / 2,
                color: R.colors.primaryLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
