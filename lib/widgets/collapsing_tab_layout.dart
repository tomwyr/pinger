import 'package:flutter/material.dart';

class CollapsingTabLayout extends StatefulWidget {
  final SliverAppBar appBar;
  final TabBarView tabBarView;
  final double collapsedOffset;
  final ScrollController scrollController;
  final Future<void> Function(double) scroller;

  const CollapsingTabLayout({
    Key key,
    @required this.appBar,
    @required this.tabBarView,
    @required this.collapsedOffset,
    @required this.scrollController,
    @required this.scroller,
  }) : super(key: key);

  @override
  _CollapsingTabLayoutState createState() => _CollapsingTabLayoutState();
}

class _CollapsingTabLayoutState extends State<CollapsingTabLayout> {
  bool _isSnapping = false;
  ScrollUpdateNotification _lastScrollUpdate;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _onScrollEvent,
      child: NestedScrollView(
        controller: widget.scrollController,
        headerSliverBuilder: (headerContext, __) => <Widget>[
          SliverOverlapAbsorber(
            handle:
                NestedScrollView.sliverOverlapAbsorberHandleFor(headerContext),
            child: widget.appBar,
          ),
        ],
        body: widget.tabBarView,
      ),
    );
  }

  bool _onScrollEvent(Notification notification) {
    if (_isSnapping) return false;
    if (notification is ScrollUpdateNotification) {
      _lastScrollUpdate = notification;
    } else if (notification is ScrollEndNotification) {
      if (widget.scrollController.offset > 0.0 &&
          widget.scrollController.offset < widget.collapsedOffset) {
        _isSnapping = true;
        _scheduleSnapScroll(_lastScrollUpdate.scrollDelta > 0.0);
        return true;
      }
    }
    return false;
  }

  void _scheduleSnapScroll(bool scrollsUpwards) {
    Future(() async {
      await widget.scroller(scrollsUpwards ? widget.collapsedOffset : 0.0);
      _lastScrollUpdate = null;
      _isSnapping = false;
    });
  }
}

class CollapsingTabLayoutItem extends StatelessWidget {
  final List<Widget> slivers;

  const CollapsingTabLayoutItem({Key key, @required this.slivers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        ...slivers,
      ],
    );
  }
}
