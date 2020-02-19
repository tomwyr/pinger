import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/utils/format_utils.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final ArchiveStore _archiveStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Archive"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              // TODO switch between list/grouping mode
            },
          ),
        ],
      ),
      body: Observer(builder: (_) {
        final sessions = _archiveStore.sessions;
        if (sessions == null) return Center(child: CircularProgressIndicator());
        if (sessions.isEmpty) return _buildEmptySessions();
        return _buildSessionsData(sessions);
      }),
    );
  }

  Widget _buildEmptySessions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(children: <Widget>[
        Spacer(),
        Image.asset('assets/box_empty.png', height: 144.0),
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
          onPressed: () {
            // TODO navigate to a place where user can start new ping session (home/search)
          },
        ),
        Container(height: 64.0),
      ]),
    );
  }

  Widget _buildSessionsData(List<PingSession> sessions) {
    return ListView.separated(
      itemCount: sessions.length,
      itemBuilder: (_, index) {
        final item = sessions[index];
        return ListTile(
          leading: Icon(Icons.language),
          title: Text(
            item.host,
            style: TextStyle(fontSize: 18.0),
            maxLines: 1,
          ),
          trailing: Row(
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
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 0.5,
        width: double.infinity,
        margin: EdgeInsets.only(left: 64.0),
        color: Colors.grey,
      ),
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
