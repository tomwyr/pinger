import 'dart:math';

import 'package:flutter/material.dart';

import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/ui/page/session/session_ping_gauge.dart';
import 'package:pinger/ui/page/session/session_values/session_values_chart.dart';
import 'package:pinger/ui/page/session/session_values/session_values_list.dart';
import 'package:pinger/ui/shared/view_type/view_type_row.dart';
import 'package:pinger/ui/shared/view_type/view_types.dart';

class SessionValuesSection extends StatefulWidget {
  const SessionValuesSection({
    Key? key,
    required this.session,
    required this.sessionDuration,
    required this.viewType,
    required this.onViewTypeChanged,
  }) : super(key: key);

  final PingSession session;
  final Duration sessionDuration;
  final PingValuesType viewType;
  final ValueChanged<PingValuesType> onViewTypeChanged;

  @override
  _SessionValuesSectionState createState() => _SessionValuesSectionState();
}

class _SessionValuesSectionState extends State<SessionValuesSection> {
  final _headerSafeHeight = 40.0;
  final _gaugeSafeHeight = 128.0;
  final _listSafeHeight = 0.0;
  final _chartSafeHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => OverflowBox(
        alignment: Alignment.topCenter,
        maxHeight: max(constraints.maxHeight, _calcSafeHeight()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: _headerSafeHeight,
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(children: <Widget>[
                Text(
                  S.current.sessionResultsSubtitle,
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                if (widget.session.status.isSession)
                  Expanded(
                    child: ViewTypeRow(
                      labeledTypes: {
                        PingValuesType.gauge: S.current.viewTypeGaugleLabel,
                        PingValuesType.list: S.current.viewTypeListLabel,
                        PingValuesType.chart: S.current.viewTypeChartLabel,
                      },
                      selection: widget.viewType,
                      onChanged: widget.onViewTypeChanged,
                    ),
                  ),
              ]),
            ),
            Expanded(child: _buildViewTypeContent()),
          ],
        ),
      ),
    );
  }

  double _calcSafeHeight() {
    switch (widget.viewType) {
      case PingValuesType.gauge:
        return _headerSafeHeight + _gaugeSafeHeight;
      case PingValuesType.list:
        return _headerSafeHeight + _listSafeHeight;
      case PingValuesType.chart:
        return _headerSafeHeight + _chartSafeHeight;
    }
  }

  Widget _buildViewTypeContent() {
    switch (widget.viewType) {
      case PingValuesType.gauge:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: LayoutBuilder(
            builder: (_, constraints) => Padding(
              padding:
                  EdgeInsets.only(top: (constraints.maxHeight - _gaugeSafeHeight).clamp(0.0, 16.0)),
              child: SessionPingGauge(
                session: widget.session,
                duration: widget.sessionDuration,
              ),
            ),
          ),
        );
      case PingValuesType.list:
        return SessionValuesList(
          shouldFollowHead: widget.session.status.isStarted,
          values: widget.session.values,
        );
      case PingValuesType.chart:
        return Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0.0),
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
        );
    }
  }
}
