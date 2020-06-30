import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/shared/chart/result_summary_chart.dart';

class ResultDetailsSummaryChart extends StatelessWidget {
  const ResultDetailsSummaryChart({
    Key key,
    @required this.padding,
    @required this.height,
    @required this.result,
  }) : super(key: key);

  final double padding;
  final double height;
  final PingResult result;

  final Size labelSize = const Size(64.0, 18.0);

  @override
  Widget build(BuildContext context) {
    final meanHeightRatio = (result.stats.mean - result.stats.min) /
        (result.stats.max - result.stats.min);
    final meanLineTop = padding + height * (1 - meanHeightRatio);
    return SizedBox(
      height: height + 2 * padding,
      child: LayoutBuilder(
        builder: (_, constraints) => Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            _buildChart(padding),
            _buildChartMeanLine(padding, meanLineTop),
            ..._buildChartLabels(
              constraints.maxWidth,
              padding,
              meanLineTop,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(double padding) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      width: double.infinity,
      child: ResultSummaryChart(
        minIndex: result.values.indexWhere((it) => it == result.stats.min),
        maxIndex: result.values.indexWhere((it) => it == result.stats.max),
        values: result.values,
      ),
    );
  }

  Widget _buildChartMeanLine(double padding, double meanLineTop) {
    return Positioned(
      top: meanLineTop,
      left: 0.0,
      right: 0.0,
      child: DottedBorder(
        customPath: (size) => Path()..lineTo(size.width, 0.0),
        color: R.colors.secondary,
        dashPattern: [4, 4],
        strokeWidth: 2.0,
        child: Container(),
      ),
    );
  }

  List<Widget> _buildChartLabels(
      double width, double padding, double meanLineTop) {
    final pingCount = result.values.length;
    final indexMin = result.values.indexOf(result.stats.min);
    final indexMax = result.values.indexOf(result.stats.max);
    return [
      Positioned(
        top: 0.0,
        left: width * (indexMax / (pingCount - 1)),
        child: _buildLabel(result.stats.max, labelSize),
      ),
      Positioned(
        top: meanLineTop - labelSize.height / 2,
        left: width / 2,
        child: _buildLabel(result.stats.mean, labelSize),
      ),
      Positioned(
        bottom: 0.0,
        left: width * (indexMin / (pingCount - 1)),
        child: _buildLabel(result.stats.min, labelSize),
      ),
    ];
  }

  Widget _buildLabel(int value, Size size) {
    return FractionalTranslation(
      translation: Offset(-0.5, 0.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: R.colors.primaryLight),
          color: R.colors.canvas,
        ),
        child: Text(
          S.current.pingValueLabel(value),
          style: TextStyle(color: R.colors.secondary, fontSize: 12.0),
        ),
      ),
    );
  }
}
