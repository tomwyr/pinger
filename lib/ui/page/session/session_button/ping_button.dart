import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/page/session/session_button/ping_floating_button.dart';
import 'package:pinger/ui/page/session/session_button/ping_lock_indicator.dart';

class PingButton extends StatefulWidget {
  final Duration animDuration = const Duration(milliseconds: 500);

  final IconData primaryIcon;
  final IconData secondaryIcon;
  final bool isExpanded;
  final bool isLocked;
  final VoidCallback onPrimaryPressed;
  final VoidCallback onPrimaryLongPressStart;
  final VoidCallback onPrimaryLongPressEnd;
  final VoidCallback onSecondaryPressed;
  final VoidCallback onLockSwipe;

  const PingButton({
    Key key,
    @required this.primaryIcon,
    @required this.secondaryIcon,
    @required this.isExpanded,
    this.isLocked,
    this.onPrimaryPressed,
    this.onPrimaryLongPressStart,
    this.onPrimaryLongPressEnd,
    this.onSecondaryPressed,
    this.onLockSwipe,
  }) : super(key: key);

  @override
  _PingButtonState createState() => _PingButtonState();
}

class _PingButtonState extends State<PingButton> {
  final _miniSize = 40.0;
  final _fullSize = 56.0;
  final _spacing = 48.0;
  final _lockDimens = PingLockIndicatorDimens();
  final _lockSwipe = ValueNotifier<double>(null);

  bool _didLongPress = false;
  bool _didLockSwipe = false;
  bool _isSwiping = false;
  double _swipeTotalDelta = 0.0;

  @override
  void didUpdateWidget(PingButton old) {
    super.didUpdateWidget(old);
    if (!_isSwiping) _syncSwipe();
  }

  @override
  void initState() {
    super.initState();
    _syncSwipe();
  }

  @override
  void dispose() {
    _lockSwipe.dispose();
    super.dispose();
  }

  void _syncSwipe() {
    _lockSwipe.value = widget.isLocked == true ? 1.0 : 0.0;
  }

  void _onLongPressStart() {
    _didLongPress = true;
    widget.onPrimaryLongPressStart?.call();
  }

  void _onLongPressEnd() {
    _didLongPress = false;
    if (_didLockSwipe) {
      _didLockSwipe = false;
      widget.onLockSwipe?.call();
    } else {
      widget.onPrimaryLongPressEnd?.call();
    }
  }

  void _onSwipeUpdate(double delta) {
    if (_didLongPress) {
      _isSwiping = true;
      _swipeTotalDelta += delta;
      _lockSwipe.value =
          (_swipeTotalDelta / (_fullSize + _lockDimens.totalWidth))
              .clamp(-1.0, 1.0)
              .abs();
    }
  }

  void _onSwipeEnd() {
    if (_didLongPress) {
      _isSwiping = false;
      if (_lockSwipe.value == 1.0 && _didLongPress) {
        _didLockSwipe = true;
        widget.onLockSwipe?.call();
      }
      _lockSwipe.value = 0.0;
      _swipeTotalDelta = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _animateChild(
          calcMargin: (it) => EdgeInsets.only(
            left: _fullSize + (_fullSize + _spacing) * it,
          ),
          child: _buildLockIndicator(TextDirection.ltr),
        ),
        _animateChild(
          calcMargin: (it) => EdgeInsets.only(
            right: _fullSize + (_fullSize + _spacing) * it,
          ),
          child: _buildLockIndicator(TextDirection.rtl),
        ),
        _animateChild(
          calcMargin: (it) => EdgeInsets.only(
            right: (_miniSize + _spacing) * it,
          ),
          child: _buildSecondaryButton(),
        ),
        _animateChild(
          calcMargin: (it) => EdgeInsets.only(
            left: (_fullSize + _spacing) * it,
          ),
          child: _buildPrimaryButton(),
        ),
      ],
    );
  }

  Widget _animateChild({
    @required Widget child,
    @required EdgeInsets calcMargin(double value),
  }) {
    final expansion = widget.isExpanded ? 1.0 : 0.0;
    return TweenAnimationBuilder<double>(
      duration: widget.animDuration,
      tween: Tween(begin: expansion, end: expansion),
      builder: (_, value, __) => Container(
        margin: calcMargin(value),
        child: child,
      ),
    );
  }

  Widget _buildLockIndicator(TextDirection direction) {
    return PingLockIndicator(
      duration: widget.animDuration,
      direction: direction,
      isLocked: widget.isLocked,
      margin: _fullSize + 16.0,
      color: ColorTween(begin: R.colors.gray, end: R.colors.secondary),
      dimens: _lockDimens,
      swipe: _lockSwipe,
    );
  }

  Widget _buildSecondaryButton() {
    return PingFloatingButton(
      duration: widget.animDuration,
      size: _miniSize,
      raised: widget.isExpanded,
      icon: widget.secondaryIcon,
      iconColor: R.colors.primaryLight,
      backgroundColor: R.colors.canvas,
      onTap: widget.onSecondaryPressed,
    );
  }

  Widget _buildPrimaryButton() {
    return PingFloatingButton(
      duration: widget.animDuration,
      size: _fullSize,
      raised: true,
      icon: widget.primaryIcon,
      iconColor: R.colors.white,
      backgroundColor: R.colors.secondary,
      onTap: widget.onPrimaryPressed,
      onLongPressStart: _onLongPressStart,
      onLongPressEnd: _onLongPressEnd,
      onSwipeUpdate: _onSwipeUpdate,
      onSwipeEnd: _onSwipeEnd,
    );
  }
}
