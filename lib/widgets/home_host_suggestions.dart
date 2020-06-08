import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/favorites_page.dart';
import 'package:pinger/page/recents_page.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/common/collapsing_header_delegate.dart';
import 'package:pinger/widgets/common/scroll_edge_gradient.dart';
import 'package:pinger/widgets/common/transparent_gradient_box.dart';
import 'package:pinger/widgets/home_hosts_section.dart';
import 'package:pinger/widgets/tiles/host_tile.dart';

class HomeHostSuggestions extends StatefulWidget {
  final Widget searchBar;
  final ValueChanged<String> onItemPressed;
  final PingSession session;
  final List<String> favorites;
  final List<String> popular;
  final Map<String, HostStats> stats;

  const HomeHostSuggestions({
    Key key,
    @required this.searchBar,
    @required this.onItemPressed,
    @required this.session,
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
      top: false,
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
          bottomItemExtent: widget.session != null ? 96.0 : 0.0,
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
          bottomItem: widget.session != null
              ? HomeHostsSection(
                  title: "Current",
                  hosts: [widget.session.host],
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
          title: "Favorites",
          emptyLabel: "Bookmark pinged hosts to access them easily",
          hosts: widget.favorites,
          itemLimit: 5,
          onItemPressed: widget.onItemPressed,
          onMorePressed: () => push(FavoritesPage()),
        ),
      ),
      SliverToBoxAdapter(child: Container(height: 32.0)),
      SliverToBoxAdapter(
        child: HomeHostsSection(
          title: "Recents",
          emptyLabel: "Latest host will show up here after you ping one",
          hosts: widget.stats.keys.toList(),
          itemLimit: 5,
          onItemPressed: widget.onItemPressed,
          onMorePressed: () => push(RecentsPage()),
        ),
      ),
      if (widget.popular.isNotEmpty) ...[
        SliverToBoxAdapter(child: Container(height: 32.0)),
        SliverToBoxAdapter(
          child: HomeHostsSection(
            title: "Popular",
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
