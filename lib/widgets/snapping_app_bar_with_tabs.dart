import 'package:flutter/material.dart';

class SnappingAppBarWithTabs extends StatefulWidget {
  final SliverAppBar appBar;
  final TabBarView tabBarView;
  final double collapsedOffset;
  final ScrollController scrollController;
  final Future<void> Function(double) scroller;

  const SnappingAppBarWithTabs({
    Key key,
    @required this.appBar,
    @required this.tabBarView,
    @required this.collapsedOffset,
    @required this.scrollController,
    @required this.scroller,
  }) : super(key: key);

  @override
  _SnappingAppBarWithTabsState createState() => _SnappingAppBarWithTabsState();
}

class _SnappingAppBarWithTabsState extends State<SnappingAppBarWithTabs> {
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
        body: Builder(
          builder: (bodyContext) {
            _wrapTabViews(bodyContext);
            return widget.tabBarView;
          },
        ),
      ),
    );
  }

  void _wrapTabViews(BuildContext context) {
    final children = widget.tabBarView.children;
    final wrappedChildren = children.map((it) => CustomScrollView(
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            it,
          ],
        ));
    children.setRange(0, children.length, wrappedChildren);
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
