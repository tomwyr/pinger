import 'dart:math';

import 'package:flutter/material.dart';

import 'package:pinger/extensions.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/utils/format_utils.dart';

class SessionPingGauge extends StatelessWidget {
  SessionPingGauge({
    Key? key,
    required this.session,
    required this.duration,
  })  : minValue = _getMinValue(session),
        maxValue = _getMaxValue(session),
        super(key: key);

  final PingSession session;
  final Duration? duration;
  final int? minValue;
  final int? maxValue;
  final Size edgeValuesSize = const Size(48.0, 24.0);

  static int? _getMinValue(PingSession session) => session.stats != null ? 0 : null;

  static int? _getMaxValue(PingSession session) {
    if (session.stats != null) {
      final max = session.stats!.max;
      final firstDigit = int.parse(max.toString().substring(0, 1));
      final maxFirstDigit = firstDigit < 1
          ? 1
          : firstDigit < 2
              ? 2
              : firstDigit < 5
                  ? 5
                  : 10;
      return maxFirstDigit * pow(10, max.toString().length - 1).toInt();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          height: min(
            constraints.maxHeight,
            constraints.maxWidth / 2 + edgeValuesSize.height,
          ),
          child: Stack(children: <Widget>[
            Positioned.fill(
              bottom: edgeValuesSize.height,
              child: PingGaugeArc.forSession(session, maxValue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _buildArcEdgeLabel(true),
                _buildResultsLabels(),
                _buildArcEdgeLabel(false),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildArcEdgeLabel(bool isMin) {
    return SizedBox(
      width: edgeValuesSize.width,
      child: Align(
        alignment: isMin ? Alignment.bottomLeft : Alignment.bottomRight,
        child: FractionalTranslation(
          translation: Offset(isMin ? -0.5 : 0.5, 0.0),
          child: Text(
            (isMin ? minValue : maxValue)?.toString() ?? "",
            style: TextStyle(fontSize: 14.0, color: R.colors.gray),
          ),
        ),
      ),
    );
  }

  Widget _buildResultsLabels() {
    return Column(children: <Widget>[
      const Spacer(flex: 4),
      Container(
        height: 24.0,
        alignment: Alignment.bottomCenter,
        child: Text(
          _getDeltaLabel(session.values!),
          style: TextStyle(fontSize: 24.0, color: R.colors.gray),
        ),
      ),
      const Spacer(flex: 1),
      Container(
        height: 40.0,
        alignment: Alignment.center,
        child: Text(
          _getValueLabel(session.values!.lastOrNull),
          style: const TextStyle(fontSize: 36.0),
        ),
      ),
      const Spacer(flex: 1),
      Container(
        height: 24.0,
        alignment: Alignment.bottomCenter,
        child: Text(
          FormatUtils.getDurationLabel(duration!),
          style: TextStyle(fontSize: 24.0, color: R.colors.secondary),
        ),
      ),
    ]);
  }

  String _getDeltaLabel(List<int?> values) {
    if (values.length > 1 && values.last != null) {
      final previous = values.reversed.skip(1).firstWhere((it) => it != null, orElse: () => null);
      if (previous != null) {
        final delta = (values.last! - previous).round();
        return delta < 0 ? "$delta" : "+$delta";
      }
    }
    return "-";
  }

  String _getValueLabel(int? value) => value != null ? S.current.pingValueLabel(value) : "-";
}

class PingGaugeArc extends StatefulWidget {
  const PingGaugeArc({
    Key? key,
    required this.progress,
    required this.value,
    required this.isActive,
    required this.duration,
  }) : super(key: key);

  factory PingGaugeArc.forSession(PingSession session, int? gaugeMaxValue) {
    final progress = !session.status.isQuickCheck
        ? session.settings.count.when(
            finite: (it) => session.values!.length / it,
            infinite: () => 0.0,
          )
        : 0.0;
    final lastResult = session.values!.lastWhere((it) => it != null, orElse: () => null);
    final value = lastResult != null ? lastResult / gaugeMaxValue! : null;
    return PingGaugeArc(
      progress: progress,
      value: value,
      isActive: session.status.isStarted,
      duration: const Duration(milliseconds: 800),
    );
  }

  final double? value;
  final double progress;
  final bool isActive;
  final Duration duration;

  @override
  State<PingGaugeArc> createState() => _PingGaugeArcState();
}

class _PingGaugeArcState extends State<PingGaugeArc> with SingleTickerProviderStateMixin {
  late AnimationController _animator;
  late Animation<double> _arcProgressAnim;
  late Animation<double> _dotValueAnim;

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(vsync: this, duration: widget.duration);
    _arcProgressAnim = AlwaysStoppedAnimation(widget.progress);
    _dotValueAnim = AlwaysStoppedAnimation(widget.value ?? 0.5);
  }

  @override
  void didUpdateWidget(PingGaugeArc old) {
    super.didUpdateWidget(old);
    if (old.progress != widget.progress || old.value != widget.value) {
      _arcProgressAnim = Tween<double>(
        begin: _arcProgressAnim.value,
        end: widget.progress,
      ).chain(CurveTween(curve: Curves.easeInOut)).animate(_animator);
      _dotValueAnim = Tween<double>(
        begin: _dotValueAnim.value,
        end: widget.value ?? old.value ?? _dotValueAnim.value,
      ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(_animator);
      _animator.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animator,
      builder: (_, __) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CustomPaint(
            painter: PingGaugeArcPainter(
              progress: 1.0,
              width: 4.0,
              color: R.colors.grayLight,
            ),
          ),
          CustomPaint(
            painter: PingGaugeArcPainter(
              progress: _arcProgressAnim.value,
              width: 4.0,
              color: R.colors.primaryLight,
            ),
          ),
          PingGaugeDot(
            value: _dotValueAnim.value,
            isActive: widget.isActive,
            duration: widget.duration,
          ),
        ],
      ),
    );
  }
}

class PingGaugeDot extends StatefulWidget {
  const PingGaugeDot({
    Key? key,
    required this.value,
    required this.isActive,
    required this.duration,
  }) : super(key: key);

  final double value;
  final bool isActive;
  final Duration duration;

  @override
  State<PingGaugeDot> createState() => _PingGaugeDotState();
}

class _PingGaugeDotState extends State<PingGaugeDot> with SingleTickerProviderStateMixin {
  late Animation<Color?> _dotColorAnim;
  late AnimationController _animator;

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(vsync: this, duration: widget.duration);
    _dotColorAnim = AlwaysStoppedAnimation(widget.isActive ? R.colors.secondary : R.colors.gray);
  }

  @override
  void didUpdateWidget(PingGaugeDot old) {
    super.didUpdateWidget(old);
    if (old.isActive != widget.isActive) {
      _dotColorAnim = ColorTween(
        begin: _dotColorAnim.value,
        end: !widget.isActive ? R.colors.gray : R.colors.secondary,
      ).animate(_animator);
      _animator.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotColorAnim,
      builder: (_, __) => CustomPaint(
        painter: PingGaugeDotPainter(
          value: widget.value,
          radius: 8.0,
          color: _dotColorAnim.value,
        ),
      ),
    );
  }
}

class PingGaugeArcPainter extends CustomPainter {
  PingGaugeArcPainter({
    required this.progress,
    required this.width,
    required this.color,
  });

  final double progress;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, 2 * size.height);
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, pi, progress * pi, false, paint);
  }

  @override
  bool shouldRepaint(PingGaugeArcPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.width != width || oldDelegate.color != color;
}

class PingGaugeDotPainter extends CustomPainter {
  PingGaugeDotPainter({
    required this.value,
    required this.radius,
    required this.color,
  });

  final double value;
  final double radius;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final offset = _calcDotPosition(size);
    final paint = Paint()..color = color!;
    final shadowPaint = Paint()
      ..color = color!
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0);
    canvas
      ..drawCircle(offset, radius + 1.0, shadowPaint)
      ..drawCircle(offset, radius, paint);
  }

  Offset _calcDotPosition(Size size) {
    final bottomCenter = Offset(size.width / 2, size.height);
    final dx = -size.width / 2 * cos(pi * value);
    final dy = -size.height * sin(pi * value);
    return bottomCenter + Offset(dx, dy);
  }

  @override
  bool shouldRepaint(PingGaugeDotPainter oldDelegate) =>
      oldDelegate.value != value || oldDelegate.radius != radius || oldDelegate.color != color;
}
