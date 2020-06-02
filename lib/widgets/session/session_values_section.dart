import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/widgets/session/session_ping_gauge.dart';
import 'package:pinger/widgets/session/session_values_chart.dart';
import 'package:pinger/widgets/session/session_values_list.dart';
import 'package:pinger/widgets/view_type_button.dart';
import 'package:pinger/widgets/view_types.dart';

class SessionValuesSection extends StatefulWidget {
  final PingSession session;
  final Duration sessionDuration;
  final PingValuesType viewType;
  final ValueChanged<PingValuesType> onViewTypeChanged;

  const SessionValuesSection({
    Key key,
    @required this.session,
    @required this.sessionDuration,
    @required this.viewType,
    @required this.onViewTypeChanged,
  }) : super(key: key);

  @override
  _SessionValuesSectionState createState() => _SessionValuesSectionState();
}

class _SessionValuesSectionState extends State<SessionValuesSection> {
  final _chartSafeHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 24.0),
          Row(children: <Widget>[
            Text(
              "Results",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            if (widget.session.status.isSession) ...[
              _buildTypeButton(PingValuesType.gauge, "Gauge"),
              Container(width: 8.0),
              _buildTypeButton(PingValuesType.list, "List"),
              Container(width: 8.0),
              _buildTypeButton(PingValuesType.chart, "Chart"),
            ],
          ]),
          Container(height: 32.0),
          if (widget.viewType == PingValuesType.gauge)
            SessionPingGauge(
              session: widget.session,
              duration: widget.sessionDuration,
            )
          else if (widget.viewType == PingValuesType.list)
            Expanded(
              child: SessionValuesList(
                shouldFollowHead: widget.session.status.isStarted,
                values: widget.session.values,
              ),
            )
          else if (widget.viewType == PingValuesType.chart)
            Expanded(
              child: LayoutBuilder(
                builder: (_, constraints) => OverflowBox(
                  maxHeight: max(constraints.maxHeight, _chartSafeHeight),
                  child: SessionValuesChart(
                    values: widget.session.values,
                    stats: widget.session.stats,
                    shouldFollowHead: widget.session.status.isStarted,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(PingValuesType type, String label) {
    return ViewTypeButton(
      label: label,
      selected: widget.viewType == type,
      onPressed: () {
        if (widget.viewType != type) widget.onViewTypeChanged(type);
      },
    );
  }
}
