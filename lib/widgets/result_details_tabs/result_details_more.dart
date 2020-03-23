import 'package:flutter/material.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/widgets/collapsing_tab_layout.dart';
import 'package:pinger/widgets/ping_session_item.dart';
import 'package:pinger/widgets/separated_sliver_list.dart';

class ResultDetailsMore extends StatefulWidget {
  final List<PingResult> results;
  final ValueChanged<PingResult> onItemSelected;
  final VoidCallback onStartPingPressed;

  const ResultDetailsMore({
    Key key,
    @required this.results,
    @required this.onItemSelected,
    @required this.onStartPingPressed,
  }) : super(key: key);

  @override
  _ResultDetailsMoreState createState() => _ResultDetailsMoreState();
}

class _ResultDetailsMoreState extends State<ResultDetailsMore> {
  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      if (widget.results.isEmpty)
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(children: <Widget>[
              Spacer(),
              Image(image: Images.boxEmpty, height: 144.0),
              Spacer(),
              Text(
                "There’s nothing here yet",
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              Container(height: 24.0),
              Text(
                "Other results will show up here once you finish at least one ping for this host",
                textAlign: TextAlign.center,
              ),
              Spacer(),
              RaisedButton(
                child: Text("Start now"),
                onPressed: widget.onStartPingPressed,
              ),
              Container(height: 40.0),
            ]),
          ),
        )
      else
        SeparatedSliverList(
          itemCount: widget.results.length,
          itemBuilder: (_, index) {
            final item = widget.results[index];
            return PingResultItem(
              result: item,
              onTap: () => widget.onItemSelected(item),
            );
          },
          separatorBuilder: (_, __) => Divider(),
        )
    ]);
  }
}
