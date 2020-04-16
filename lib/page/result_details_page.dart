import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/collapsing_tab_layout.dart';
import 'package:pinger/widgets/collapsing_tile.dart';
import 'package:pinger/widgets/result_details_tabs/result_details_global.dart';
import 'package:pinger/widgets/result_details_tabs/result_details_info.dart';
import 'package:pinger/widgets/result_details_tabs/result_details_more.dart';
import 'package:pinger/widgets/result_details_tabs/result_details_results.dart';

enum ResultDetailsTab { results, global, info, more }

class ResultDetailsPage extends StatefulWidget {
  final PingResult result;

  const ResultDetailsPage({Key key, @required this.result}) : super(key: key);

  @override
  _ResultDetailsPageState createState() => _ResultDetailsPageState();
}

class _ResultDetailsPageState extends State<ResultDetailsPage>
    with SingleTickerProviderStateMixin {
  static const _collapsingTileHeight = 480.0;
  static const _collapsedHeight = kToolbarHeight + 48.0;
  static const _collapsedOffset = _collapsingTileHeight - _collapsedHeight;

  final ArchiveStore _archiveStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();
  final LocationStore _locationStore = Injector.resolve();
  final SettingsStore _settingsStore = Injector.resolve();

  ResultDetailsTab _selectedTab = ResultDetailsTab.results;
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      vsync: this,
      length: ResultDetailsTab.values.length,
    );
    _archiveStore.fetchGlobalResults(widget.result.host.name);
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
        child: CollapsingTabLayout(
          collapsedOffset: _collapsedOffset,
          scrollController: _scrollController,
          scroller: _scrollLayoutTo,
          appBar: _buildAppBar(),
          tabBarView: _buildTabBarView(),
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      elevation: 2.0,
      forceElevated: true,
      expandedHeight: _collapsingTileHeight,
      backgroundColor: Theme.of(context).canvasColor,
      leading: BackButton(color: Colors.black),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: () async {
            await _archiveStore.deleteLocalResult(widget.result.id);
            pop();
          },
        ),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (_, constraints) => ResultDetailsCollapsingTile(
          expansion: (constraints.maxHeight - _collapsedHeight) /
              (_collapsingTileHeight - _collapsedHeight),
          result: widget.result,
          minExtent: kToolbarHeight,
          maxExtent: _collapsingTileHeight,
        ),
      ),
      bottom: TabBar(
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
    );
  }

  void _onTabTap(int index) {
    final tab = ResultDetailsTab.values[index];
    if (_selectedTab == tab) {
      final offset =
          _scrollController.offset == _collapsedOffset ? 0.0 : _collapsedOffset;
      _scrollLayoutTo(offset);
    } else {
      _selectedTab = tab;
      _tabController.animateTo(ResultDetailsTab.values.indexOf(tab));
      if (_scrollController.offset < _collapsedOffset) {
        _scrollLayoutTo(_collapsedOffset);
      }
    }
  }

  Future<void> _scrollLayoutTo(double offset) async {
    await _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        ResultDetailsResults(
          values: widget.result.values,
          stats: widget.result.stats,
          scrollBuilder: (slivers) => CollapsingTabLayoutItem(slivers: slivers),
        ),
        Observer(
          builder: (_) => ResultDetailsGlobal(
            isSharingLocation: _checkIsSharingLocation(),
            onShareLocationPressed: _enableShareSettings,
            userResult: widget.result,
            globalResults: _archiveStore.globalResults[widget.result.host.name],
          ),
        ),
        ResultDetailsInfo(result: widget.result),
        Observer(
          builder: (_) {
            return ResultDetailsMore(
              results: _archiveStore.localResults
                  .where((it) =>
                      it.host.name == widget.result.host.name &&
                      it.id != widget.result.id)
                  .toList(),
              onItemSelected: (item) => push(ResultDetailsPage(result: item)),
              onStartPingPressed: () {
                _pingStore.initSession(widget.result.host.name);
                pushReplacement(PingPage());
              },
            );
          },
        ),
      ],
    );
  }

  bool _checkIsSharingLocation() {
    final shareSettings = _settingsStore.userSettings.shareSettings;
    return shareSettings.shareResults &&
        shareSettings.attachLocation &&
        _locationStore.hasPermission;
  }

  void _enableShareSettings() {
    _settingsStore.update(
      _settingsStore.userSettings.copyWith(
        shareSettings: ShareSettings(
          shareResults: true,
          attachLocation: true,
        ),
      ),
    );
  }
}

class ResultDetailsCollapsingTile extends StatelessWidget {
  final PingResult result;
  final double expansion;
  final double minExtent;
  final double maxExtent;

  ResultDetailsCollapsingTile({
    @required this.result,
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
                "Result details",
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
                    child: Image.network('https://www.netflix.com/favicon.ico'),
                  ),
                ),
                label: Container(
                  height: 56.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        result.host.name,
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
                      final meanLineTop = chartPadding +
                          chartHeight *
                              (1 - result.stats.mean / result.stats.max);
                      return Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          _buildChart(chartPadding),
                          _buildChartMeanLine(chartPadding, meanLineTop),
                          ..._buildChartLabels(
                              constraints.maxWidth, chartPadding, meanLineTop),
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
                      result.values.length.toString(),
                    ),
                    _buildSummaryItem(
                      Icons.timer,
                      FormatUtils.getDurationLabel(result.duration),
                    ),
                    _buildSummaryItem(
                      Icons.calendar_today,
                      FormatUtils.getTimestampLabel(result.startTime),
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
    final minIndex = result.values.indexWhere((it) => it == result.stats.min);
    final maxIndex = result.values.indexWhere((it) => it == result.stats.max);
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
                  result.values.length,
                  (index) => FlSpot(index.toDouble(), result.values[index]),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildChartMeanLine(double chartPadding, double meanLineTop) {
    return Positioned(
      top: meanLineTop,
      left: 0.0,
      right: 0.0,
      child: DottedBorder(
        customPath: (size) => Path()..lineTo(size.width, 0.0),
        color: Colors.pink,
        dashPattern: [4, 4],
        strokeWidth: 2.0,
        child: Container(),
      ),
    );
  }

  List<Widget> _buildChartLabels(
      double chartWidth, double chartPadding, double meanLineTop) {
    final labelSize = Size(64.0, 18.0);
    final pingCount = result.values.length;
    final indexMin = result.values.indexOf(result.stats.min);
    final indexMax = result.values.indexOf(result.stats.max);
    return [
      Positioned(
        top: 0.0,
        left: chartWidth * (indexMax / (pingCount - 1)) - labelSize.width / 2,
        child: _buildLabel(result.stats.max, labelSize),
      ),
      Positioned(
        top: meanLineTop - labelSize.height / 2,
        left: 0.0,
        right: 0.0,
        child: _buildLabel(result.stats.mean, labelSize),
      ),
      Positioned(
        bottom: 0.0,
        left: chartWidth * (indexMin / (pingCount - 1)) - labelSize.width / 2,
        child: _buildLabel(result.stats.min, labelSize),
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
