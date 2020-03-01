import 'package:flutter/material.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/session_details/session_details_collapsing_tile.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_global.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_info.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_more.dart';
import 'package:pinger/page/session_details/session_details_tabs/session_details_results.dart';
import 'package:pinger/store/archive_store.dart';
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
              SessionDetailsResults(),
              SessionDetailsGlobal(),
              SessionDetailsInfo(),
              SessionDetailsMore(),
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
