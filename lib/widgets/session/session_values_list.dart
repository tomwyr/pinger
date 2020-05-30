import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/widgets/session/session_values_item.dart';
import 'package:pinger/widgets/session/session_values_scrollable.dart';

class SessionValuesList extends StatefulWidget {
  final PingSession session;

  const SessionValuesList({Key key, @required this.session}) : super(key: key);

  @override
  _SessionValuesListState createState() => _SessionValuesListState();
}

class _SessionValuesListState extends State<SessionValuesList>
    with SingleTickerProviderStateMixin {
  final _listKey = GlobalKey<AnimatedListState>();
  final _insertDuration = const Duration(milliseconds: 500);

  ValueNotifier<bool> _didReachHead;
  ScrollController _scroller;

  @override
  void initState() {
    super.initState();
    _didReachHead = ValueNotifier(true);
    _scroller = ScrollController()..addListener(_updateDidReachHead);
  }

  @override
  void dispose() {
    _scroller.dispose();
    _didReachHead.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SessionValuesList old) {
    super.didUpdateWidget(old);
    final lengthDiff = widget.session.values.length - old.session.values.length;
    for (var i = 0; i < lengthDiff; i++) {
      _listKey.currentState.insertItem(0, duration: _insertDuration);
    }
  }

  void _updateDidReachHead() {
    _didReachHead.value = _scroller.offset == 0.0;
  }

  Future<void> _animateToHead() async {
    await _scroller.animateTo(
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
      shouldFollowHead: widget.session.status.isStarted,
      moveToHeadValue: _animateToHead,
      child: AnimatedList(
        key: _listKey,
        controller: _scroller,
        initialItemCount: widget.session.values.length,
        itemBuilder: (_, index, animation) => SizeTransition(
          sizeFactor: animation,
          axisAlignment: 1.0,
          child: SessionValuesItem.reversed(
            values: widget.session.values,
            index: index,
          ),
        ),
      ),
    );
  }
}
