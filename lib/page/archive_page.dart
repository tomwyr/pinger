import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/page/session_details_page.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/utils/format_utils.dart';

part 'archive_page.freezed.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage>
    with SingleTickerProviderStateMixin {
  final ArchiveStore _archiveStore = Injector.resolve();

  ArchiveViewType _viewType = ArchiveViewType.list();
  AnimationController _animator;

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _viewType.maybeWhen(
        host: (_) {
          setState(() => _viewType = ArchiveViewType.groups());
          return false;
        },
        orElse: () => true,
      ),
      child: Scaffold(
        appBar: _viewType.maybeWhen(
          host: (name) => AppBar(
            leading: BackButton(
              onPressed: () => setState(() {
                _viewType = ArchiveViewType.groups();
              }),
            ),
            title: Text(name),
          ),
          orElse: () => AppBar(
            leading: BackButton(),
            title: Text("Archive"),
            actions: <Widget>[_buildViewTypeIcon()],
          ),
        ),
        body: Observer(builder: (_) {
          final sessions = _archiveStore.sessions;
          if (sessions == null)
            return Center(child: CircularProgressIndicator());
          if (sessions.isEmpty) return _buildEmptySessions();
          return _viewType.when(
            list: () => _buildSessionsList(sessions),
            groups: () => _buildSessionsGroups(sessions),
            host: (name) => _buildSelectedHost(
                sessions.where((it) => it.host.name == name).toList()),
          );
        }),
      ),
    );
  }

  Widget _buildSelectedHost(List<PingSession> sessions) {
    return ListView.separated(
      itemCount: sessions.length,
      itemBuilder: (_, index) {
        final item = sessions[index];
        return ListTile(
          onTap: () => push(SessionDetailsPage(session: item)),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(Icons.compare_arrows),
              ),
              Container(
                width: 32.0,
                margin: EdgeInsets.only(left: 4.0),
                child: Text(
                  item.results.values.length.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(Icons.timer),
              ),
              Container(
                width: 48.0,
                margin: EdgeInsets.only(left: 4.0),
                child: Text(
                  _formatSessionDuration(item.duration),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          trailing: _buildItemTrailing(item),
        );
      },
      separatorBuilder: (_, __) => _buildSeparator(margin: 0.0),
    );
  }

  String _formatSessionDuration(Duration duration) {
    final min = duration.inMinutes;
    final sec = duration.inSeconds - min * 60;
    return "$min:${sec.toString().padLeft(2, '0')}";
  }

  Widget _buildViewTypeIcon() {
    return GestureDetector(
      onTap: () => setState(() {
        if (_viewType is ArchiveListView) {
          _viewType = ArchiveViewType.groups();
          _animator.forward();
        } else {
          _viewType = ArchiveViewType.list();
          _animator.reverse();
        }
      }),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedIcon(
          icon: AnimatedIcons.view_list,
          progress: _animator,
        ),
      ),
    );
  }

  Widget _buildEmptySessions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(children: <Widget>[
        Spacer(),
        Image(image: Images.boxEmpty, height: 144.0),
        Container(height: 32.0),
        Text(
          "There't nothing here yet",
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        Container(height: 32.0),
        Text(
          "Save results after pinging a host or let the app make it each time automatically in settings",
          textAlign: TextAlign.center,
        ),
        Spacer(),
        RaisedButton(
          child: Text("Start now"),
          onPressed: () => pushAndRemoveUntil(SearchPage(), (it) => it.isFirst),
        ),
        Container(height: 64.0),
      ]),
    );
  }

  Widget _buildSessionsList(List<PingSession> sessions) {
    return ListView.separated(
      itemCount: sessions.length,
      itemBuilder: (_, index) {
        final item = sessions[index];
        return ListTile(
          onTap: () => push(SessionDetailsPage(session: item)),
          leading: Icon(Icons.language),
          title: Text(
            item.host.name,
            style: TextStyle(fontSize: 18.0),
            maxLines: 1,
          ),
          trailing: _buildItemTrailing(item),
        );
      },
      separatorBuilder: (_, __) => _buildSeparator(),
    );
  }

  Widget _buildItemTrailing(PingSession item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        PingSummaryChart(results: item.results),
        SizedBox(
          width: 48.0,
          child: Text(
            FormatUtils.getSinceNowLabel(item.timestamp),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildSessionsGroups(List<PingSession> sessions) {
    final countsMap = <String, int>{};
    sessions.forEach((it) => !countsMap.containsKey(it.host)
        ? countsMap[it.host.name] = 1
        : ++countsMap[it.host.name]);
    final hostCounts = countsMap.entries.toList()
      ..sort((e1, e2) => e2.value - e1.value);
    return ListView.separated(
      itemCount: hostCounts.length,
      itemBuilder: (_, index) {
        final item = hostCounts[index];
        return ListTile(
          onTap: () => setState(() {
            _viewType = ArchiveViewType.host(name: item.key);
          }),
          leading: Icon(Icons.language),
          title: Text(item.key, style: TextStyle(fontSize: 18.0)),
          trailing: SizedBox(
            width: 72.0,
            child: Text(
              "${item.value} results",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => _buildSeparator(),
    );
  }

  Widget _buildSeparator({double margin = 64.0}) {
    return Container(
      height: 0.5,
      width: double.infinity,
      margin: EdgeInsets.only(left: margin),
      color: Colors.grey,
    );
  }
}

class PingSummaryChart extends StatelessWidget {
  final PingResults results;
  final double width;
  final double height;
  final double barWidth;

  const PingSummaryChart({
    Key key,
    @required this.results,
    this.width = 96.0,
    this.height = 40.0,
  })  : this.barWidth = width / 3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(children: <Widget>[
        BarChart(BarChartData(
          groupsSpace: 0.0,
          borderData: FlBorderData(show: false),
          axisTitleData: FlAxisTitleData(show: false),
          titlesData: FlTitlesData(show: false),
          barGroups: [
            _buildBarData(0, results.min),
            _buildBarData(1, results.mean),
            _buildBarData(2, results.max),
          ],
        )),
        LineChart(LineChartData(
          titlesData: FlTitlesData(show: false),
          axisTitleData: FlAxisTitleData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              dotData: FlDotData(show: false),
              isCurved: true,
              preventCurveOverShooting: true,
              colors: [Colors.lightBlue],
              spots: List.generate(
                results.values.length,
                (index) => FlSpot(index.toDouble(), results.values[index]),
              ),
            ),
          ],
        )),
      ]),
    );
  }

  BarChartGroupData _buildBarData(int index, double value) {
    return BarChartGroupData(x: index, barRods: [
      BarChartRodData(
        y: value,
        width: barWidth,
        color: Colors.lightBlue.withOpacity(0.25),
        borderRadius: BorderRadius.zero,
      ),
    ]);
  }
}

@freezed
abstract class ArchiveViewType with _$ArchiveViewType {
  const factory ArchiveViewType.list() = ArchiveListView;
  const factory ArchiveViewType.groups() = ArchiveGroupsView;
  const factory ArchiveViewType.host({String name}) = ArchiveHostView;
}
