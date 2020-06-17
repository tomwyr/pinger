import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/widgets/session/session_summary_section.dart';
import 'package:pinger/widgets/session/session_values_chart.dart';
import 'package:pinger/widgets/session/session_values_list.dart';
import 'package:pinger/widgets/view_type/view_type_row.dart';
import 'package:pinger/widgets/view_type/view_types.dart';

class ResultDetailsResultsTab extends StatefulWidget {
  final List<int> values;
  final PingStats stats;
  final Widget Function(List<Widget> slivers) scrollBuilder;

  const ResultDetailsResultsTab({
    Key key,
    @required this.values,
    @required this.stats,
    @required this.scrollBuilder,
  }) : super(key: key);

  @override
  _ResultDetailsResultsTabState createState() =>
      _ResultDetailsResultsTabState();
}

class _ResultDetailsResultsTabState extends State<ResultDetailsResultsTab> {
  PingValuesType _viewType = PingValuesType.list;

  @override
  Widget build(BuildContext context) {
    return widget.scrollBuilder(<Widget>[
      _buildCommonSection(),
      if (_viewType == PingValuesType.list)
        _buildResultsList()
      else if (_viewType == PingValuesType.chart)
        _buildResultsChart()
    ]);
  }

  Widget _buildCommonSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(height: 16.0),
            SessionSummarySection(
              values: widget.values,
              stats: widget.stats,
            ),
            Container(height: 16.0),
            Row(children: <Widget>[
              Text(
                "Results",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ViewTypeRow(
                  types: const {
                    PingValuesType.list: "List",
                    PingValuesType.chart: "Chart"
                  },
                  selection: _viewType,
                  onChanged: (it) => setState(() => _viewType = it),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsList() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          // Constrain with finite height to prevent layout
          // error and to obtain actual box constraints.
          height: 0.0,
          child: LayoutBuilder(
            builder: (_, constraints) => SizedBox(
              width: double.infinity,
              height: constraints.maxHeight,
              child: SessionValuesList(
                values: widget.values,
                shouldFollowHead: false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultsChart() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 128.0),
          child: SessionValuesChart(
            values: widget.values,
            stats: widget.stats,
            shouldFollowHead: false,
          ),
        ),
      ),
    );
  }
}
