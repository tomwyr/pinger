import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';

class SessionPingButton extends StatefulWidget {
  final PingSession session;
  final Duration pingDuration;
  final bool isArchived;
  final VoidCallback onQuickCheckStart;
  final VoidCallback onQuickCheckStop;
  final VoidCallback onSessionStart;
  final VoidCallback onSessionPause;
  final VoidCallback onSessionResume;
  final VoidCallback onSessionStop;
  final VoidCallback onRestart;
  final VoidCallback onResultArchive;

  const SessionPingButton({
    Key key,
    @required this.session,
    @required this.pingDuration,
    @required this.isArchived,
    @required this.onQuickCheckStart,
    @required this.onQuickCheckStop,
    @required this.onSessionStart,
    @required this.onSessionPause,
    @required this.onSessionResume,
    @required this.onSessionStop,
    @required this.onRestart,
    @required this.onResultArchive,
  }) : super(key: key);

  @override
  _SessionPingButtonState createState() => _SessionPingButtonState();
}

class _SessionPingButtonState extends State<SessionPingButton> {
  final Duration _animDuration = const Duration(milliseconds: 500);
  final double _miniButtonSize = 40.0;
  final double _normalButtonSize = 56.0;
  final double _buttonsMargin = 24.0;

  PingStatus _prevStatus;

  double get _contentWidth =>
      _miniButtonSize + _normalButtonSize + _buttonsMargin;

  @override
  void didUpdateWidget(SessionPingButton old) {
    super.didUpdateWidget(old);
    if (old.session.status != widget.session.status) {
      _prevStatus = old.session.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isExpanded = !widget.isArchived &&
        (widget.session.status == PingStatus.sessionPaused ||
            widget.session.status == PingStatus.sessionDone);
    return SizedBox(
      height: _normalButtonSize,
      width: _contentWidth,
      child: Stack(children: <Widget>[
        AnimatedAlign(
          duration: _animDuration,
          alignment: isExpanded ? Alignment.centerLeft : Alignment.center,
          child: _buildSecondaryButton(isExpanded),
        ),
        AnimatedAlign(
          duration: _animDuration,
          alignment: isExpanded ? Alignment.centerRight : Alignment.center,
          child: _buildPrimaryButton(),
        ),
      ]),
    );
  }

  Widget _buildSecondaryButton(bool isExpanded) {
    switch (widget.session.status) {
      case PingStatus.quickCheckDone:
      case PingStatus.quickCheckStarted:
        return null;
      case PingStatus.sessionStarted:
      case PingStatus.sessionPaused:
      case PingStatus.initial:
        return _prevStatus.isDone
            ? _buildArchiveButton(isExpanded)
            : _buildStopButton(isExpanded);
      case PingStatus.sessionDone:
        return _buildArchiveButton(isExpanded);
    }
    throw StateError(
        "Unknown status of ping session: ${widget.session.status}");
  }

  Widget _buildArchiveButton(bool isExpanded) {
    return _buildFloatingButton(
      icon: Icons.archive,
      iconColor: R.colors.primaryLight,
      backgroundColor: R.colors.canvas,
      mini: true,
      onTap: widget.onResultArchive,
      raised: isExpanded,
    );
  }

  Widget _buildStopButton(bool isExpanded) {
    return _buildFloatingButton(
      icon: Icons.stop,
      iconColor: R.colors.primaryLight,
      backgroundColor: R.colors.canvas,
      mini: true,
      onTap: widget.onSessionStop,
      raised: isExpanded,
    );
  }

  Widget _buildPrimaryButton() {
    switch (widget.session.status) {
      case PingStatus.initial:
      case PingStatus.quickCheckDone:
        return _buildFloatingButton(
          icon: Icons.play_arrow,
          onTap: widget.onSessionStart,
          onLongPressStart: widget.onQuickCheckStart,
        );
      case PingStatus.quickCheckStarted:
        return _buildFloatingButton(
          icon: Icons.lens,
          onTap: widget.onSessionPause,
          onLongPressEnd: widget.onQuickCheckStop,
        );
      case PingStatus.sessionStarted:
        return _buildFloatingButton(
          icon: Icons.pause,
          onTap: widget.onSessionPause,
          onLongPress: widget.onSessionStop,
        );
      case PingStatus.sessionPaused:
        return _buildFloatingButton(
          icon: Icons.play_arrow,
          onTap: widget.onSessionResume,
        );
      case PingStatus.sessionDone:
        return _buildFloatingButton(
          icon: Icons.undo,
          onTap: widget.onRestart,
        );
    }
    throw StateError(
        "Unknown status of ping session: ${widget.session.status}");
  }

  Widget _buildFloatingButton({
    @required IconData icon,
    Color iconColor,
    Color backgroundColor,
    bool mini = false,
    bool raised = true,
    VoidCallback onTap,
    VoidCallback onLongPress,
    VoidCallback onLongPressStart,
    VoidCallback onLongPressEnd,
  }) {
    final size = mini ? 40.0 : 56.0;
    final color = raised ? R.colors.shadow : R.colors.none;
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onLongPressStart: (_) => onLongPressStart?.call(),
      onLongPressEnd: (_) => onLongPressEnd?.call(),
      child: SizedBox.fromSize(
        size: Size.square(size),
        child: TweenAnimationBuilder<Color>(
          tween: ColorTween(begin: color, end: color),
          curve: Interval(raised ? 0.5 : 0.0, raised ? 1.0 : 0.5),
          duration: _animDuration,
          builder: (_, value, __) => DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor ?? R.colors.secondary,
              borderRadius: BorderRadius.circular(size / 2),
              boxShadow: [
                BoxShadow(
                  color: value,
                  spreadRadius: 0.5,
                  blurRadius: 4.0,
                )
              ],
            ),
            child: Icon(icon, color: iconColor ?? R.colors.canvas),
          ),
        ),
      ),
    );
  }
}
