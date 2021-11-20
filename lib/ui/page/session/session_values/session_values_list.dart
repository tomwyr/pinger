import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/common/scroll_edge_gradient.dart';
import 'package:pinger/ui/common/transparent_gradient_box.dart';
import 'package:pinger/ui/page/session/session_values/session_values_item.dart';
import 'package:pinger/ui/page/session/session_values/session_values_scrollable.dart';

class SessionValuesList extends StatefulWidget {
  final List<int?>? values;
  final bool shouldFollowHead;

  const SessionValuesList({
    Key? key,
    required this.values,
    required this.shouldFollowHead,
  }) : super(key: key);

  @override
  _SessionValuesListState createState() => _SessionValuesListState();
}

class _SessionValuesListState extends State<SessionValuesList>
    with SingleTickerProviderStateMixin {
  final _insertDuration = const Duration(milliseconds: 500);

  var _listKey = GlobalKey<AnimatedListState>();

  ScrollController? _scroller;
  ValueNotifier<bool>? _didReachHead;

  @override
  void initState() {
    super.initState();
    _didReachHead = ValueNotifier(true);
    _scroller = ScrollController()..addListener(_updateDidReachHead);
  }

  @override
  void dispose() {
    _scroller!.dispose();
    _didReachHead!.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SessionValuesList old) {
    super.didUpdateWidget(old);
    if (widget.values!.isEmpty && old.values!.isNotEmpty) {
      // Reassign key to drop old state that keeps reference to previous results
      _listKey = GlobalKey();
    } else {
      final lengthDiff = widget.values!.length - old.values!.length;
      for (var i = 0; i < lengthDiff; i++) {
        _listKey.currentState!.insertItem(0, duration: _insertDuration);
      }
    }
  }

  void _updateDidReachHead() {
    _didReachHead!.value = _scroller!.offset == 0.0;
  }

  Future<void> _animateToHead() async {
    await _scroller!.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SessionValuesScrollable(
      axis: Axis.vertical,
      didReachHead: _didReachHead,
      shouldFollowHead: widget.shouldFollowHead,
      moveToHeadValue: _animateToHead,
      child: ScrollEdgeGradient(
        color: R.colors.canvas,
        controller: _scroller,
        builder: (controller) => AnimatedList(
          key: _listKey,
          padding: const EdgeInsets.all(16.0),
          controller: controller,
          initialItemCount: widget.values!.length,
          itemBuilder: (_, index, animation) => AnimatedBuilder(
            animation: animation,
            builder: (_, child) => Stack(children: <Widget>[
              ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: animation.value,
                  child: child,
                ),
              ),
              Positioned.fill(
                child: TransparentGradientBox(
                  direction: AxisDirection.down,
                  color: R.colors.canvas.withOpacity(
                    (animation.value < 0.8) ? 1.0 : (1.0 - animation.value) * 5,
                  ),
                ),
              ),
            ]),
            child: SessionValuesItem.reversed(
              values: widget.values!,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
