import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/collapsing_tile.dart';
import 'package:pinger/widgets/const_extent_header_delegate.dart';

enum SessionDetailsTab { results, global, info, more }

class SessionDetailsPage extends StatefulWidget {
  final PingSession session;

  const SessionDetailsPage({Key key, @required this.session}) : super(key: key);

  @override
  _SessionDetailsPageState createState() => _SessionDetailsPageState();
}

class _SessionDetailsPageState extends State<SessionDetailsPage>
    with SingleTickerProviderStateMixin {
  final ArchiveStore _archiveStore = Injector.resolve();
  final double _collapsingTileHeight = 432.0;
  final double _tabBarHeight = 48.0;

  SessionDetailsTab _selectedTab = SessionDetailsTab.results;
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      vsync: this,
      length: SessionDetailsTab.values.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (_, __) => <Widget>[
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              elevation: 0.0,
              expandedHeight: _collapsingTileHeight,
              backgroundColor: Theme.of(context).canvasColor,
              leading: BackButton(color: Colors.black),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.black),
                  onPressed: () async {
                    await _archiveStore.deleteSession(widget.session.id);
                    pop();
                  },
                ),
              ],
              flexibleSpace: LayoutBuilder(
                builder: (_, constraints) => SessionSummaryCollapsingTile(
                  expansion: (constraints.maxHeight - kToolbarHeight) /
                      (_collapsingTileHeight - kToolbarHeight),
                  session: widget.session,
                  minExtent: kToolbarHeight,
                  maxExtent: _collapsingTileHeight,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ConstExtentHeaderDelegate(
                extent: _tabBarHeight,
                builder: (_) => Material(
                  elevation: 4.0,
                  child: Container(
                    color: Theme.of(context).canvasColor,
                    child: TabBar(
                      onTap: _onTabTap,
                      controller: _tabController,
                      labelColor: Colors.black,
                      indicatorColor: Colors.lightBlue,
                      tabs: [
                        Tab(text: "Results"),
                        Tab(text: "Global"),
                        Tab(text: "Info"),
                        Tab(text: "More"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView(
                children: List.generate(
                    50, (index) => ListTile(title: Text('Result $index'))),
              ),
              ListView(
                children: List.generate(
                    50, (index) => ListTile(title: Text('Global $index'))),
              ),
              ListView(
                children: List.generate(
                    50, (index) => ListTile(title: Text('Info $index'))),
              ),
              ListView(
                children: List.generate(
                    50, (index) => ListTile(title: Text('More $index'))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabTap(int index) {
    final tab = SessionDetailsTab.values[index];
    if (_selectedTab == tab) {
      final offset = _scrollController.offset == _collapsingTileHeight
          ? 0.0
          : _collapsingTileHeight;
      _scrollTo(offset);
    } else {
      _selectedTab = tab;
      _tabController.animateTo(SessionDetailsTab.values.indexOf(tab));
      if (_scrollController.offset < _collapsingTileHeight) {
        _scrollTo(_collapsingTileHeight);
      }
    }
  }

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}

class SessionSummaryCollapsingTile extends StatelessWidget {
  final PingSession session;
  final double expansion;
  final double minExtent;
  final double maxExtent;

  SessionSummaryCollapsingTile({
    @required this.session,
    @required this.expansion,
    @required this.minExtent,
    @required this.maxExtent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.topCenter,
        child: Opacity(
          opacity: expansion,
          child: Container(
            height: minExtent,
            margin: EdgeInsets.symmetric(horizontal: 48.0),
            child: Center(
              child: Text(
                "Session details",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: minExtent * expansion,
        left: 24.0,
        right: 24.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(height: 16.0 * expansion),
            Container(
              height: 56.0 * (1 + expansion),
              margin: EdgeInsets.symmetric(horizontal: 48.0),
              padding: EdgeInsets.only(right: 12.0),
              child: CollapsingTile(
                expansion: expansion,
                avatar: Container(
                  width: 56.0,
                  height: 56.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    elevation: 4.0 * expansion,
                    child: Image.network(session.host.avatarUrl),
                  ),
                ),
                label: Container(
                  height: 56.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        session.host.name,
                        style: TextStyle(fontSize: 18.0 + 6.0 * expansion),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 16.0),
            Container(
              height: 96.0 + 2 * 24.0,
              child: Opacity(
                opacity: expansion,
                child: Builder(builder: (_) {
                  final chartHeight = 96.0;
                  final chartPadding = 24.0;
                  return SizedBox(
                    height: chartHeight + 2 * chartPadding,
                    child: LayoutBuilder(builder: (_, constraints) {
                      final chartSize = Size(constraints.maxWidth, chartHeight);
                      final meanLineTop = chartPadding +
                          chartSize.height *
                              (1 - session.results.mean / session.results.max);
                      return Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          _buildChart(chartPadding),
                          _buildChartMeanLine(
                              chartSize, chartPadding, meanLineTop),
                          ..._buildChartLabels(
                              chartSize, chartPadding, meanLineTop),
                        ],
                      );
                    }),
                  );
                }),
              ),
            ),
            Container(height: 16.0),
            Container(
              height: 64.0,
              child: Opacity(
                opacity: expansion,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildSummaryItem(
                      Icons.compare_arrows,
                      session.results.values.length.toString(),
                    ),
                    _buildSummaryItem(
                      Icons.timer,
                      FormatUtils.getDurationLabel(session.duration),
                    ),
                    _buildSummaryItem(
                      Icons.calendar_today,
                      FormatUtils.getTimestampLabel(session.timestamp),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 16.0),
          ],
        ),
      ),
    ]);
  }

  Widget _buildChart(double chartPadding) {
    final minIndex =
        session.results.values.indexWhere((it) => it == session.results.min);
    final maxIndex =
        session.results.values.indexWhere((it) => it == session.results.max);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: chartPadding),
      child: LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: LineChart(LineChartData(
            titlesData: FlTitlesData(show: false),
            axisTitleData: FlAxisTitleData(show: false),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                dotData: FlDotData(
                  show: true,
                  dotColor: Colors.pink,
                  checkToShowDot: (it) => it.x == minIndex || it.x == maxIndex,
                ),
                isCurved: true,
                preventCurveOverShooting: true,
                colors: [Colors.lightBlue],
                spots: List.generate(
                  session.results.values.length,
                  (index) =>
                      FlSpot(index.toDouble(), session.results.values[index]),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildChartMeanLine(
      Size chartSize, double chartPadding, double meanLineTop) {
    return Positioned(
      top: meanLineTop,
      left: 0.0,
      right: 0.0,
      child: DottedBorder(
        customPath: Path()..lineTo(chartSize.width, 0.0),
        color: Colors.pink,
        dashPattern: [4, 4],
        strokeWidth: 2.0,
        child: Container(),
      ),
    );
  }

  List<Widget> _buildChartLabels(
      Size chartSize, double chartPadding, double meanLineTop) {
    final labelSize = Size(64.0, 18.0);
    final pingCount = session.results.values.length;
    final indexMin = session.results.values.indexOf(session.results.min);
    final indexMax = session.results.values.indexOf(session.results.max);
    return [
      Positioned(
        top: 0.0,
        left: chartSize.width * (indexMax / (pingCount - 1)) -
            labelSize.width / 2,
        child: _buildLabel(session.results.max, labelSize),
      ),
      Positioned(
        top: meanLineTop - labelSize.height / 2,
        left: 0.0,
        right: 0.0,
        child: _buildLabel(session.results.mean, labelSize),
      ),
      Positioned(
        bottom: 0.0,
        left: chartSize.width * (indexMin / (pingCount - 1)) -
            labelSize.width / 2,
        child: _buildLabel(session.results.min, labelSize),
      ),
    ];
  }

  Widget _buildLabel(double value, Size size) {
    return SizedBox.fromSize(
      size: size,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.pink),
            color: Colors.pink[100],
          ),
          child: Text(
            " ${value.round()} ms",
            style: TextStyle(color: Colors.pink, fontSize: 12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(IconData icon, String label) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.lightBlue),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12.0),
              child: Text(label, style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      ),
    );
  }
}
