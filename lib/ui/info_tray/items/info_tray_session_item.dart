import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/utils/format_utils.dart';

class InfoTraySessionItem extends StatelessWidget {
  final PingSession session;
  final Duration duration;
  final VoidCallback onButtonPressed;
  final VoidCallback onPressed;
  final Duration animDuration = const Duration(milliseconds: 1000);
  final int maxBarCount = 30;
  final double gapWidth = 3.0;

  const InfoTraySessionItem({
    Key key,
    @required this.session,
    @required this.duration,
    @required this.onButtonPressed,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (session == null) return Container();
    return Material(
      color: R.colors.none,
      child: SizedBox(
        width: double.infinity,
        height: 112.0,
        child: Row(children: <Widget>[
          Expanded(child: _buildSessionInfo()),
          Container(width: 12.0),
          _buildButton(),
        ]),
      ),
    );
  }

  Widget _buildSessionInfo() {
    return InkWell(
      onTap: onPressed,
      child: Column(children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: _buildResultsChart(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildProgressIndicator(),
              ),
            ]),
          ),
        ),
        Container(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildTextInfo(),
        ),
      ]),
    );
  }

  Widget _buildResultsChart() {
    if (session.values.isNullOrEmpty) return Container();
    return LayoutBuilder(
      builder: (_, constraints) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          for (final item in _createChartBarItems(constraints))
            Padding(
              key: ValueKey(item.key),
              padding: EdgeInsets.only(left: item.index == 0 ? 0.0 : gapWidth),
              child: TweenAnimationBuilder<double>(
                duration: animDuration,
                tween: Tween(
                    begin: 0.0,
                    end: item.value != null
                        ? item.value / item.maxValue * item.size.height
                        : item.size.height),
                builder: (_, value, __) => Container(
                  width: item.size.width,
                  height: value,
                  color: item.value != null
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                ),
              ),
            )
        ],
      ),
    );
  }

  Iterable<_ChartBarItem> _createChartBarItems(BoxConstraints constraints) {
    final barCount = session.settings.count.when(
      finite: (it) => min(it, maxBarCount),
      infinite: () => maxBarCount,
    );
    final visibleBarCount =
        session.status.isSessionDone ? barCount : barCount - 1;
    final firstVisible = max(session.values.length - visibleBarCount, 0);
    final visibleValues = session.values.skip(firstVisible);
    final visibleMax = PingStats.fromValues(visibleValues).max;
    final barsSpace = constraints.maxWidth - ((barCount - 1) * gapWidth);
    final barSize = Size(barsSpace / barCount, constraints.maxHeight);
    return visibleValues.mapIndexed((index, value) => _ChartBarItem(
          key: index + firstVisible,
          index: index,
          value: value,
          maxValue: visibleMax,
          size: barSize,
        ));
  }

  Widget _buildProgressIndicator() {
    final valuesCount = session.values?.length ?? 0;
    final progress = session.settings.count.when(
      finite: (it) => valuesCount / it,
      infinite: () => min(valuesCount, maxBarCount - 1) / maxBarCount,
    );
    final dotSize = 6.0;
    return FractionalTranslation(
      translation: Offset(0.0, 0.5),
      child: SizedBox(
        height: dotSize,
        child: Stack(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _buildProgressBar(progress),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildProgressDot(progress, dotSize),
          ),
        ]),
      ),
    );
  }

  Widget _buildProgressBar(double progress) {
    return Container(
      width: double.infinity,
      height: 2.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: R.colors.white,
      ),
      alignment: Alignment.centerLeft,
      child: TweenAnimationBuilder<double>(
        duration: animDuration,
        tween: Tween(begin: progress, end: progress),
        builder: (_, value, child) => FractionallySizedBox(
          widthFactor: value,
          child: child,
        ),
        child: Container(
          width: double.infinity,
          height: 2.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: R.colors.secondary,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressDot(double progress, double size) {
    return TweenAnimationBuilder<double>(
      duration: animDuration,
      tween: Tween(begin: 0.0, end: progress * 2.0 - 1.0),
      builder: (_, value, child) => Align(
        alignment: Alignment(value, 0.0),
        child: FractionalTranslation(
          translation: Offset(value / 2, 0.0),
          child: child,
        ),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: R.colors.secondary,
          boxShadow: [
            BoxShadow(
              color: R.colors.secondary,
              blurRadius: 4.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    final style = TextStyle(color: R.colors.white);
    final sideWidth = 48.0;
    return Row(children: <Widget>[
      SizedBox(
        width: sideWidth,
        child: Text(
          duration != null ? FormatUtils.getDurationLabel(duration) : "",
          style: style,
          textAlign: TextAlign.start,
        ),
      ),
      Expanded(
        child: Text(
          session.host,
          style: style,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
      ),
      SizedBox(
        width: sideWidth,
        child: Text(
          session.values != null
              ? "${session.values.length}/${FormatUtils.getCountLabel(session.settings.count)}"
              : "",
          textAlign: TextAlign.end,
          style: style,
        ),
      ),
    ]);
  }

  Widget _buildButton() {
    if (!session.status.isSession) return Container();
    return SizedBox.fromSize(
      size: Size.square(56.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: R.colors.secondary, width: 3.0),
            ),
          ),
          Center(
            child: IconButton(
              onPressed: onButtonPressed,
              icon: Icon(
                session.status.isSessionStarted
                    ? Icons.pause
                    : session.status.isSessionPaused
                        ? Icons.play_arrow
                        : Icons.undo,
                color: R.colors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBarItem {
  final int key;
  final int index;
  final int value;
  final int maxValue;
  final Size size;

  _ChartBarItem({
    @required this.key,
    @required this.index,
    @required this.value,
    @required this.maxValue,
    @required this.size,
  });
}
