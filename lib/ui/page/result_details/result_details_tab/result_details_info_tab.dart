import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/common/collapsing_tab_layout.dart';
import 'package:pinger/utils/format_utils.dart';

class ResultDetailsInfoTab extends StatelessWidget {
  final PingResult result;

  const ResultDetailsInfoTab({Key key, @required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(S.current.pingInfoInfoSubtitle),
              _buildItem(
                S.current.pingInfoDateLabel,
                FormatUtils.getTimestampLabel(result.startTime, showTime: true),
              ),
              _buildItem(
                S.current.pingInfoDurationLabel,
                FormatUtils.getDurationLabel(result.duration),
              ),
              Container(height: 24.0),
              _buildHeader(S.current.pingInfoSettingsSubtitle),
              _buildItem(
                S.current.settingsPingCountLabel,
                "${FormatUtils.getCountLabel(result.settings.count)} ${S.current.settingsPingCountUnit}",
              ),
              _buildItem(
                S.current.settingsPingPacketSizeLabel,
                "${result.settings.packetSize}  ${S.current.settingsPingPacketSizeUnit}",
              ),
              _buildItem(
                S.current.settingsPingIntervalLabel,
                "${result.settings.interval}  ${S.current.settingsPingIntervalUnit}",
              ),
              _buildItem(
                S.current.settingsPingTimeoutLabel,
                "${result.settings.timeout}  ${S.current.settingsPingTimeoutUnit}",
              ),
            ],
          ),
        ),
      )
    ]);
  }

  Widget _buildHeader(String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }

  Widget _buildItem(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(children: <Widget>[
        Text(name, style: TextStyle(color: R.colors.gray, fontSize: 18.0)),
        Spacer(),
        Text(value, style: TextStyle(fontSize: 18.0)),
      ]),
    );
  }
}
