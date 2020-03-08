import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/fake_data.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/session_details/session_details_collapsing_tile.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_global.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_info.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_more.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_results.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/widgets/snapping_app_bar_with_tabs.dart';

enum SessionDetailsTab { results, global, info, more }

class SessionDetailsPage extends StatefulWidget {
  final PingSession session;

  const SessionDetailsPage({Key key, @required this.session}) : super(key: key);

  @override
  _SessionDetailsPageState createState() => _SessionDetailsPageState();
}

class _SessionDetailsPageState extends State<SessionDetailsPage>
    with SingleTickerProviderStateMixin {
  static const _collapsingTileHeight = 480.0;
  static const _collapsedHeight = kToolbarHeight + 48.0;
  static const _collapsedOffset = _collapsingTileHeight - _collapsedHeight;

  final ArchiveStore _archiveStore = Injector.resolve();

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
        child: SnappingAppBarWithTabs(
          collapsedOffset: _collapsedOffset,
          scrollController: _scrollController,
          scroller: _scrollLayoutTo,
          appBar: SliverAppBar(
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
                  await _archiveStore.deleteSession(widget.session.id);
                  pop();
                },
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (_, constraints) => SessionSummaryCollapsingTile(
                expansion: (constraints.maxHeight - _collapsedHeight) /
                    (_collapsingTileHeight - _collapsedHeight),
                session: widget.session,
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
          ),
          tabBarView: TabBarView(
            controller: _tabController,
            children: [
              SessionDetailsResults(),
              SessionDetailsGlobal(
                hasLocationPermission: true,
                userResult: widget.session.results,
                globalResults: FakeData.globalResults,
              ),
              SessionDetailsInfo(session: widget.session),
              Observer(
                builder: (_) =>
                    SessionDetailsMore(sessions: _archiveStore.sessions),
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
      final offset =
          _scrollController.offset == _collapsedOffset ? 0.0 : _collapsedOffset;
      _scrollLayoutTo(offset);
    } else {
      _selectedTab = tab;
      _tabController.animateTo(SessionDetailsTab.values.indexOf(tab));
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
}
