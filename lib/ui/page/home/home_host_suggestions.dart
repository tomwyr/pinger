import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/common/collapsing_header_delegate.dart';
import 'package:pinger/ui/common/scroll_edge_gradient.dart';
import 'package:pinger/ui/common/transparent_gradient_box.dart';
import 'package:pinger/ui/page/home/home_hosts_section.dart';
import 'package:pinger/ui/shared/tiles/host_tile.dart';

class HomeHostSuggestions extends StatefulWidget {
  final Widget searchBar;
  final ValueChanged<String> onItemPressed;
  final String currentHost;
  final List<String> favorites;
  final List<String> popular;
  final Map<String, HostStats> stats;

  const HomeHostSuggestions({
    Key key,
    @required this.searchBar,
    @required this.onItemPressed,
    @required this.currentHost,
    @required this.favorites,
    @required this.popular,
    @required this.stats,
  }) : super(key: key);

  @override
  _HomeHostSuggestionsState createState() => _HomeHostSuggestionsState();
}

class _HomeHostSuggestionsState extends State<HomeHostSuggestions> {
  @override
  Widget build(BuildContext context) {
    return ScrollEdgeGradient(
      color: R.colors.canvas,
      start: false,
      builder: (controller) => CustomScrollView(
        controller: controller,
        slivers: _buildContentSlivers(),
      ),
    );
  }

  List<Widget> _buildContentSlivers() {
    return [
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: CollapsingHeaderDelegate(
          topItemExtent: 48.0,
          topItemPadding: 32.0,
          bottomItemExtent: widget.currentHost != null ? 96.0 : 0.0,
          bottomGradient: TransparentGradientBox(
            color: R.colors.canvas,
            direction: AxisDirection.down,
            size: 24.0,
          ),
          bottomGradientExtent: 24.0,
          color: R.colors.canvas,
          topItem: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: widget.searchBar,
          ),
          bottomItem: widget.currentHost != null
              ? HomeHostsSection(
                  title: S.current.homeCurrentSubtitle,
                  hosts: [widget.currentHost],
                  itemLimit: 1,
                  tileType: HostTileType.highlighted,
                  onItemPressed: widget.onItemPressed,
                )
              : SizedBox.shrink(),
        ),
      ),
      SliverToBoxAdapter(child: Container(height: 24.0)),
      SliverToBoxAdapter(
        child: HomeHostsSection(
          title: S.current.homeFavoritesSubtitle,
          emptyLabel: S.current.homeFavoritesEmptyPlaceholder,
          hosts: widget.favorites,
          itemLimit: 5,
          onItemPressed: widget.onItemPressed,
          onMorePressed: () => PingerApp.router.show(RouteConfig.favorites()),
        ),
      ),
      SliverToBoxAdapter(child: Container(height: 32.0)),
      SliverToBoxAdapter(
        child: HomeHostsSection(
          title: S.current.homeRecentsSubtitle,
          emptyLabel: S.current.homeRecentsEmptyPlaceholder,
          hosts: widget.stats.keys.toList(),
          itemLimit: 5,
          onItemPressed: widget.onItemPressed,
          onMorePressed: () => PingerApp.router.show(RouteConfig.recents()),
        ),
      ),
      if (widget.popular.isNotEmpty) ...[
        SliverToBoxAdapter(child: Container(height: 32.0)),
        SliverToBoxAdapter(
          child: HomeHostsSection(
            title: S.current.homePopularSubtitle,
            hosts: widget.popular,
            itemLimit: widget.popular.length,
            onItemPressed: widget.onItemPressed,
          ),
        ),
      ],
      SliverToBoxAdapter(child: Container(height: 24.0)),
    ];
  }
}
