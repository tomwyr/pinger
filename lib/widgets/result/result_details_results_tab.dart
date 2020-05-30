import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/widgets/session/session_summary_section.dart';
import 'package:pinger/widgets/session/session_values_chart.dart';
import 'package:pinger/widgets/session/session_values_item.dart';
import 'package:pinger/widgets/view_type_button.dart';
import 'package:pinger/widgets/view_types.dart';

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
  ValueNotifier<PingValuesType> _viewType;
  @override
  void initState() {
    super.initState();
    _viewType = ValueNotifier(PingValuesType.list);
  }

  @override
  void dispose() {
    _viewType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.scrollBuilder(<Widget>[
      _buildCommonSection(),
      ValueListenableBuilder<PingValuesType>(
        valueListenable: _viewType,
        builder: (_, value, __) => value == PingValuesType.list
            ? _buildResultsList()
            : value == PingValuesType.chart
                ? _buildResultsChart(context)
                : throw ArgumentError("Unhandled results view type: $value."),
      ),
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
            ValueListenableBuilder<PingValuesType>(
              valueListenable: _viewType,
              builder: (_, __, ___) => Row(children: <Widget>[
                Text(
                  "Results",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                _buildTypeButton(PingValuesType.list, "List"),
                Container(width: 8.0),
                _buildTypeButton(PingValuesType.chart, "Chart"),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeButton(PingValuesType type, String label) {
    return ViewTypeButton(
      label: label,
      selected: _viewType.value == type,
      onPressed: () => _viewType.value = type,
    );
  }

  Widget _buildResultsList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => SessionValuesItem.reversed(
            values: widget.values,
            index: index,
          ),
          childCount: widget.values.length,
        ),
      ),
    );
  }

  Widget _buildResultsChart(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverFillRemaining(
        hasScrollBody: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 192.0,
            maxHeight: 256.0,
          ),
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
