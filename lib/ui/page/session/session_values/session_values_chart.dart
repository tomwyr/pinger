import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/common/transparent_gradient_box.dart';
import 'package:pinger/ui/page/session/session_values/session_values_scrollable.dart';
import 'package:pinger/ui/shared/chart/ping_results_chart.dart';

class SessionValuesChart extends StatefulWidget {
  final List<int> values;
  final PingStats stats;
  final bool shouldFollowHead;

  SessionValuesChart({
    Key key,
    @required this.values,
    @required this.stats,
    @required this.shouldFollowHead,
  }) : super(key: key);

  @override
  _SessionValuesChartState createState() => _SessionValuesChartState();
}

class _SessionValuesChartState extends State<SessionValuesChart>
    with SingleTickerProviderStateMixin {
  final _gradientSize = 24.0;
  final _valueLabelSize = 24.0;
  final _valueLabelMargin = 12.0;

  bool _isMovingToNewHead = false;
  int _visibleDotsCount = 0;
  double _lastTickValue = 0.0;
  double _maxStartX;
  ValueNotifier<bool> _didReachHead;
  ValueNotifier<double> _startX;
  AnimationController _animator;
  Animation<double> _startAnim;

  @override
  void initState() {
    super.initState();
    _startX = ValueNotifier(null);
    _didReachHead = ValueNotifier(true);
    _animator = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _updateDotsCount();
    _updateMaxStart();
    _updateStart(_maxStartX);
  }

  @override
  void dispose() {
    _animator
      ..stop(canceled: false)
      ..dispose();
    _didReachHead.dispose();
    _startX.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SessionValuesChart old) {
    super.didUpdateWidget(old);
    _updateDotsCount();
    if (old.values.length != widget.values.length) {
      _updateMaxStart();
      _animateToNewHead();
    }
  }

  void _updateDotsCount() =>
      _visibleDotsCount = widget.values.length.clamp(5, 20);

  void _updateMaxStart() {
    _maxStartX = max(0, widget.values.length - _visibleDotsCount).toDouble();
  }

  void _animateToNewHead() async {
    _isMovingToNewHead = true;
    await _animateToHead();
    _isMovingToNewHead = false;
  }

  Future<void> _animateToHead() async {
    await _animateBy(_maxStartX - _startX.value);
  }

  void _onDragDown(DragDownDetails details) {
    _animator.stop(canceled: false);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _moveStartBy(-details.delta.dx / 30);
  }

  void _onDragEnd(DragEndDetails details) {
    final dx = details.velocity.pixelsPerSecond.dx;
    if (dx.abs() > 200) {
      final deltaTarget = -(dx ~/ 200).toDouble() - (_startX.value % 1.0);
      _animateBy(deltaTarget);
    } else {
      _settleStart();
    }
  }

  Future<void> _animateBy(double delta) async {
    _lastTickValue = 0.0;
    _startAnim = Tween<double>(begin: 0.0, end: delta)
        .chain(CurveTween(curve: Curves.easeOutQuint))
        .animate(_animator)
          ..addListener(_onAnimTick)
          ..addStatusListener(_onAnimStatus);
    if (_animator.isAnimating) _animator.stop(canceled: false);
    await _animator.forward(from: 0.0).orCancel;
  }

  void _onAnimTick() {
    _moveStartBy(_startAnim.value - _lastTickValue);
    _lastTickValue = _startAnim.value;
  }

  void _onAnimStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) _settleStart();
  }

  void _onDragCancel() => _settleStart();

  void _settleStart() => _updateStart(_startX.value.roundToDouble());

  void _moveStartBy(double delta) {
    _updateStart((_startX.value + delta).clamp(0.0, _maxStartX).toDouble());
  }

  void _updateStart(double value) {
    _startX.value = value;
    _didReachHead.value = _isMovingToNewHead ||
        _startX.value + _visibleDotsCount >= widget.values.length;
  }

  @override
  Widget build(BuildContext context) {
    return SessionValuesScrollable(
      shouldFollowHead: widget.shouldFollowHead,
      axis: Axis.horizontal,
      didReachHead: _didReachHead,
      moveToHeadValue: _animateToHead,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onHorizontalDragDown: _onDragDown,
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            onHorizontalDragCancel: _onDragCancel,
            child: ValueListenableBuilder(
              valueListenable: _startX,
              builder: (_, value, __) => PingResultsChart(
                values: widget.values,
                maxValue: widget.stats?.max,
                dotsCount: _visibleDotsCount,
                startX: value,
                valueLabelSize: _valueLabelSize,
                valueLabelMargin: _valueLabelMargin,
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: _valueLabelMargin + _valueLabelSize,
            width: _gradientSize,
            child: TransparentGradientBox(
              color: R.colors.canvas,
              direction: AxisDirection.right,
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
            width: _gradientSize,
            child: TransparentGradientBox(
              color: R.colors.canvas,
              direction: AxisDirection.left,
            ),
          ),
        ],
      ),
    );
  }
}
