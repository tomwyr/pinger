import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/results_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/common/collapsing_tab_layout.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/result_details/result_details_header.dart';
import 'package:pinger/ui/page/result_details/result_details_tab/result_details_global_tab.dart';
import 'package:pinger/ui/page/result_details/result_details_tab/result_details_info_tab.dart';
import 'package:pinger/ui/page/result_details/result_details_tab/result_details_more_tab.dart';
import 'package:pinger/ui/page/result_details/result_details_tab/result_details_results_tab.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';
import 'package:pinger/utils/host_tap_handler.dart';

enum ResultDetailsTab { results, global, info, more }

class ResultDetailsPage extends StatefulWidget {
  const ResultDetailsPage({
    super.key,
    required this.result,
  });

  final PingResult? result;

  @override
  State<ResultDetailsPage> createState() => _ResultDetailsPageState();
}

class _ResultDetailsPageState extends BaseState<ResultDetailsPage>
    with SingleTickerProviderStateMixin, HostTapHandler {
  static const _collapsingTileHeight = 480.0;
  static const _collapsedHeight = kToolbarHeight + 48.0;
  static const _collapsedOffset = _collapsingTileHeight - _collapsedHeight;

  final ResultsStore _resultsStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();
  final SettingsStore _settingsStore = Injector.resolve();
  final PermissionStore _locationPermissionStore = Injector.resolve(PermissionStore.location);

  ResultDetailsTab _selectedTab = ResultDetailsTab.results;
  ScrollController? _scrollController;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      vsync: this,
      length: ResultDetailsTab.values.length,
    );
    _resultsStore.fetchGlobalResults(widget.result!.host);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _scrollController!.dispose();
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
      leading: const BackButton(),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: _showConfirmDeleteSheet,
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
          Tab(text: S.current.resultsResultsTabLabel),
          Tab(text: S.current.resultsGlobalTabLabel),
          Tab(text: S.current.resultsInfoTabLabel),
          Tab(text: S.current.resultsMoreTabLabel),
        ],
      ),
    );
  }

  void _showConfirmDeleteSheet() {
    PingerBottomSheet.show(
      title: Text(
        S.current.confirmResultRemoveTitle,
        style: R.styles.bottomSheetTitle,
      ),
      subtitle: Text(
        S.current.confirmRemoveDesc,
        style: R.styles.bottomSheetSubtitle,
      ),
      rejectLabel: S.current.cancelButtonLabel,
      onAcceptPressed: () {
        PingerApp.router
          ..pop()
          ..pop();
        _resultsStore.deleteLocalResult(widget.result!.id);
      },
    );
  }

  void _onTabTap(int index) {
    final tab = ResultDetailsTab.values[index];
    if (_selectedTab == tab) {
      final offset = _scrollController!.offset == _collapsedOffset ? 0.0 : _collapsedOffset;
      _scrollLayoutTo(offset);
    } else {
      _selectedTab = tab;
      _tabController!.animateTo(ResultDetailsTab.values.indexOf(tab));
      if (_scrollController!.offset < _collapsedOffset) {
        _scrollLayoutTo(_collapsedOffset);
      }
    }
  }

  Future<void> _scrollLayoutTo(double offset) async {
    await _scrollController!.animateTo(
      offset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        ResultDetailsResultsTab(
          values: widget.result!.values,
          stats: widget.result!.stats,
          scrollBuilder: (slivers) => CollapsingTabLayoutItem(slivers: slivers),
        ),
        Observer(
          builder: (_) => ResultDetailsGlobalTab(
            isSharingLocation: _checkIsSharingLocation(),
            onShareLocationPressed: _enableShareSettings,
            userResult: widget.result,
            globalResults: _resultsStore.globalResults[widget.result!.host],
            onRefreshPressed: () => _resultsStore.fetchGlobalResults(widget.result!.host),
          ),
        ),
        ResultDetailsInfoTab(result: widget.result),
        Observer(
          builder: (_) => ResultDetailsMoreTab(
            results: _resultsStore.localResults!
                .where((it) => it!.host == widget.result!.host && it.id != widget.result!.id)
                .toList(),
            onItemSelected: (item) => PingerApp.router.show(RouteConfig.results(item)),
            onStartPingPressed: () => onHostTap(_pingStore, widget.result!.host),
          ),
        ),
      ],
    );
  }

  bool _checkIsSharingLocation() {
    final shareSettings = _settingsStore.userSettings!.shareSettings;
    return shareSettings.shareResults &&
        shareSettings.attachLocation &&
        _locationPermissionStore.canAccessService;
  }

  void _enableShareSettings() {
    _settingsStore.updateSettings(
      _settingsStore.userSettings!.copyWith(
        shareSettings: ShareSettings(
          shareResults: true,
          attachLocation: true,
        ),
      ),
    );
  }
}
