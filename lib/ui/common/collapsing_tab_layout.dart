import 'package:flutter/material.dart';

class CollapsingTabLayout extends StatefulWidget {
  const CollapsingTabLayout({
    Key? key,
    required this.appBar,
    required this.tabBarView,
    required this.collapsedOffset,
    required this.controller,
    required this.scrollLayout,
  }) : super(key: key);

  final SliverAppBar appBar;
  final TabBarView tabBarView;
  final double collapsedOffset;
  final ScrollController? controller;
  final Future<void> Function(double) scrollLayout;

  @override
  State<CollapsingTabLayout> createState() => _CollapsingTabLayoutState();
}

class _CollapsingTabLayoutState extends State<CollapsingTabLayout> {
  bool _isSnapping = false;
  ScrollUpdateNotification? _lastScrollUpdate;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _onScrollEvent,
      child: NestedScrollView(
        controller: widget.controller,
        headerSliverBuilder: (headerContext, __) => <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
              headerContext,
            ),
            sliver: widget.appBar,
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
      if (_lastScrollUpdate != null &&
          widget.controller!.offset > 0.0 &&
          widget.controller!.offset < widget.collapsedOffset) {
        _isSnapping = true;
        _scheduleSnapScroll(_lastScrollUpdate!.scrollDelta! > 0.0);
        return true;
      }
    }
    return false;
  }

  void _scheduleSnapScroll(bool scrollsUpwards) {
    Future(() async {
      await widget.scrollLayout(scrollsUpwards ? widget.collapsedOffset : 0.0);
      _lastScrollUpdate = null;
      _isSnapping = false;
    });
  }
}

class CollapsingTabLayoutItem extends StatelessWidget {
  const CollapsingTabLayoutItem({
    Key? key,
    required this.slivers,
    this.controller,
  }) : super(key: key);

  final List<Widget> slivers;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        ...slivers,
      ],
    );
  }
}
