import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_results/session_results_item.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_results/session_results_summary.dart';
import 'package:pinger/widgets/collapsing_tab_layout.dart';
import 'package:pinger/widgets/snapping_scroll_area.dart';
import 'package:pinger/widgets/switch_toggle_buttons.dart';

class SessionDetailsResults extends StatefulWidget {
  final PingSession session;

  const SessionDetailsResults({Key key, @required this.session})
      : super(key: key);

  @override
  _SessionDetailsResultsState createState() => _SessionDetailsResultsState();
}

class _SessionDetailsResultsState extends State<SessionDetailsResults> {
  ResultsViewType _selectedViewType = ResultsViewType.list;
  int _chartPosition = 0;

  List<double> get values => widget.session.results.values;

  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
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
            Text("Summary", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(height: 4.0),
            SessionResultsSummary(results: widget.session.results),
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
        (_, index) => SessionResultsItem.valueAt(
          values: values,
          index: index,
        ),
        childCount: values.length,
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
            SessionResultsItem.valueAt(
              values: widget.session.results.values,
              index: values.length - _chartPosition - 1,
            ),
            _buildChartResultGradient(VerticalDirection.up),
            _buildChartResultGradient(VerticalDirection.down),
          ]),
          Container(
            height: 256.0,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SnappingScrollArea(
              itemCount: values.length,
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
        height: SessionResultsItem.LINK_HEIGHT,
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
            values.length,
            (index) => FlSpot(index.toDouble(), values[index]),
          ),
        ),
      ],
    ));
  }
}

enum ResultsViewType { list, chart }
