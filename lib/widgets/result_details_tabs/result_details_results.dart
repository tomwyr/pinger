import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/widgets/snapping_scroll_area.dart';
import 'package:pinger/widgets/switch_toggle_buttons.dart';

enum ResultsViewType { list, chart }

class ResultDetailsResults extends StatefulWidget {
  final List<int> values;
  final PingStats stats;
  final Widget Function(List<Widget> slivers) scrollBuilder;

  const ResultDetailsResults({
    Key key,
    @required this.values,
    @required this.stats,
    @required this.scrollBuilder,
  }) : super(key: key);

  @override
  _ResultDetailsResultsState createState() => _ResultDetailsResultsState();
}

class _ResultDetailsResultsState extends State<ResultDetailsResults> {
  ResultsViewType _selectedViewType = ResultsViewType.list;
  int _chartPosition = 0;

  @override
  Widget build(BuildContext context) {
    return widget.scrollBuilder(<Widget>[
      _buildCommonSection(),
      _selectedViewType == ResultsViewType.list
          ? _buildResultsList()
          : _buildResultsChart(context),
    ]);
  }

  Widget _buildCommonSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ResultDetailsSummary(values: widget.values, stats: widget.stats),
            Container(height: 18.0),
            Row(children: <Widget>[
              Text("Results", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              _buildViewTypeButtons(),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildViewTypeButtons() {
    return SwitchToggleButtons(
      selection: _selectedViewType,
      values: ResultsViewType.values,
      onChanged: (it) => setState(() => _selectedViewType = it),
      builder: (_, isSelected, onPressed) => ToggleButtons(
        isSelected: isSelected,
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(28.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.format_list_bulleted),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.show_chart),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) => ResultDetailsItem(
          values: widget.values,
          index: widget.values.length - index - 1,
        ),
        childCount: widget.values.length,
      ),
    );
  }

  Widget _buildResultsChart(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(children: <Widget>[
            ResultDetailsItem(
              values: widget.values,
              index: _chartPosition,
            ),
            _buildChartResultGradient(VerticalDirection.up),
            _buildChartResultGradient(VerticalDirection.down),
          ]),
          Container(
            height: 256.0,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SnappingScrollArea(
              itemCount: widget.values.length,
              mainAxisPadding: screenSize,
              itemInterval: screenSize * 0.3,
              onPositionChanged: (it) => setState(() => _chartPosition = it),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _buildChart(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartResultGradient(VerticalDirection direction) {
    final upwards = direction == VerticalDirection.up;
    final color = Theme.of(context).canvasColor;
    return Positioned(
      top: upwards ? 0.0 : null,
      bottom: upwards ? null : 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: ResultDetailsItem.LINK_HEIGHT,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: upwards ? Alignment.topCenter : Alignment.bottomCenter,
            end: upwards ? Alignment.bottomCenter : Alignment.topCenter,
            colors: [color, color.withOpacity(0.6)],
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    return LineChart(LineChartData(
      titlesData: FlTitlesData(show: false),
      axisTitleData: FlAxisTitleData(show: false),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
      lineTouchData: LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          dotData: FlDotData(show: true, dotColor: Colors.pink),
          isCurved: true,
          preventCurveOverShooting: true,
          colors: [Colors.lightBlue],
          spots: List.generate(
            widget.values.length,
            (index) => FlSpot(
              index.toDouble(),
              widget.values[index].toDouble(),
            ),
          ),
        ),
      ],
    ));
  }
}

class ResultDetailsItem extends StatelessWidget {
  static const LINK_HEIGHT = 8.0;

  final int index;
  final int result;
  final int delta;
  final int resultsCount;

  const ResultDetailsItem._({
    Key key,
    @required this.index,
    @required this.result,
    @required this.delta,
    @required this.resultsCount,
  }) : super(key: key);

  factory ResultDetailsItem({
    Key key,
    @required List<int> values,
    @required int index,
  }) {
    final result = values[index];
    final prevResult = values.reversed
        .skip(values.length - index)
        .firstWhere((it) => it != null, orElse: () => null);
    final delta =
        result != null && prevResult != null ? result - prevResult : null;
    return ResultDetailsItem._(
      key: key,
      index: index,
      result: result,
      delta: delta,
      resultsCount: values.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        SizedBox(
          width: 64.0,
          child: _buildIndexIndicator(index),
        ),
        Expanded(
          child: Text(
            result != null ? "$result ms" : "-",
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 64.0,
          child: Text(
            (delta != null && delta != 0)
                ? delta > 0 ? "+$delta" : "$delta"
                : "-",
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }

  Widget _buildIndexIndicator(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildIndicatorLink(index != resultsCount - 1),
        Container(
          height: 32.0,
          width: 32.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color: Colors.lightBlue, width: 2.0),
          ),
          child: Center(child: Text("${index + 1}")),
        ),
        _buildIndicatorLink(index != 0),
      ],
    );
  }

  Widget _buildIndicatorLink(bool visible) {
    return Container(
      height: LINK_HEIGHT,
      width: visible ? 2.0 : 0.0,
      color: Colors.lightBlue,
    );
  }
}

class ResultDetailsSummary extends StatelessWidget {
  final List<int> values;
  final PingStats stats;

  const ResultDetailsSummary({
    Key key,
    @required this.values,
    @required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalCount = values.length;
    final successCount = values.where((it) => it != null).length;
    final failedCount = totalCount - successCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Summary", style: TextStyle(fontWeight: FontWeight.bold)),
        Container(height: 4.0),
        if (stats != null) ...[
          Row(children: <Widget>[
            _buildSummaryItem(
                "Failed", "$failedCount", failedCount / totalCount),
            _buildSummaryItem(
                "Success", "$successCount", successCount / totalCount),
            _buildSummaryItem("Total", "$totalCount", 1.0),
          ]),
          Row(children: <Widget>[
            _buildSummaryItem("Min", "${stats.min} ms", stats.min / stats.max),
            _buildSummaryItem(
                "Mean", "${stats.mean} ms", stats.mean / stats.max),
            _buildSummaryItem("Max", "${stats.max} ms", 1.0),
          ])
        ] else ...[
          Row(children: <Widget>[
            _buildSummaryItem("Success"),
            _buildSummaryItem("Failed"),
            _buildSummaryItem("Total"),
          ]),
          Row(children: <Widget>[
            _buildSummaryItem("Min"),
            _buildSummaryItem("Mean"),
            _buildSummaryItem("Max"),
          ]),
        ]
      ],
    );
  }

  Widget _buildSummaryItem(String label,
      [String value = "", double barProgress = 0.0]) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(label, style: TextStyle(color: Colors.grey)),
            Container(height: 4.0),
            _buildItemBar(barProgress, value),
          ],
        ),
      ),
    );
  }

  Stack _buildItemBar(double barProgress, String value) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        LayoutBuilder(
          builder: (_, constraints) => Container(
            height: 32.0,
            width: barProgress * constraints.maxWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.lightBlue[100],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(value),
        ),
      ],
    );
  }
}
