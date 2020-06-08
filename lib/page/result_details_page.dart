import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/widgets/common/collapsing_tab_layout.dart';
import 'package:pinger/widgets/common/scroll_edge_gradient.dart';
import 'package:pinger/widgets/result/result_details_global_tab.dart';
import 'package:pinger/widgets/result/result_details_header.dart';
import 'package:pinger/widgets/result/result_details_info_tab.dart';
import 'package:pinger/widgets/result/result_details_more_tab.dart';
import 'package:pinger/widgets/result/result_details_results_tab.dart';

enum ResultDetailsTab { results, global, info, more }

class ResultDetailsPage extends StatefulWidget {
  final PingResult result;

  const ResultDetailsPage({Key key, @required this.result}) : super(key: key);

  @override
  _ResultDetailsPageState createState() => _ResultDetailsPageState();
}

class _ResultDetailsPageState extends State<ResultDetailsPage>
    with SingleTickerProviderStateMixin {
  static final _collapsingTileHeight = 480.0;
  static final _collapsedHeight = kToolbarHeight + 48.0;
  static final _collapsedOffset = _collapsingTileHeight - _collapsedHeight;

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
    _archiveStore.fetchGlobalResults(widget.result.host);
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
          controller: _scrollController,
          scrollLayout: _scrollLayoutTo,
          appBar: _buildAppBar(),
          tabBarView: _buildTabBarView(),
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      elevation: 0.0,
      expandedHeight: _collapsingTileHeight,
      leading: BackButton(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _archiveStore.deleteLocalResult(widget.result.id);
            pop();
          },
        ),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (_, constraints) => ResultDetailsHeader(
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
        labelColor: R.colors.secondary,
        indicatorColor: R.colors.secondary,
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
      children: <Widget>[
        ResultDetailsResultsTab(
          values: widget.result.values,
          stats: widget.result.stats,
          scrollBuilder: (slivers) => CollapsingTabLayoutItem(slivers: slivers),
        ),
        Observer(
          builder: (_) => ResultDetailsGlobalTab(
            isSharingLocation: _checkIsSharingLocation(),
            onShareLocationPressed: _enableShareSettings,
            userResult: widget.result,
            globalResults: _archiveStore.globalResults[widget.result.host],
          ),
        ),
        ResultDetailsInfoTab(result: widget.result),
        Observer(
          builder: (_) => ResultDetailsMoreTab(
            results: _archiveStore.localResults
                .where((it) =>
                    it.host == widget.result.host && it.id != widget.result.id)
                .toList(),
            onItemSelected: (item) =>
                pushReplacement(ResultDetailsPage(result: item)),
            onStartPingPressed: () {
              _pingStore.initSession(widget.result.host);
              pushReplacement(PingPage());
            },
          ),
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
    _settingsStore.updateSettings(
      _settingsStore.userSettings.copyWith(
        shareSettings: ShareSettings(
          shareResults: true,
          attachLocation: true,
        ),
      ),
    );
  }
}
