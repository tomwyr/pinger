import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/page/result_details/result_details_page.dart';
import 'package:pinger/widgets/collapsing_tab_layout.dart';
import 'package:pinger/widgets/ping_session_item.dart';
import 'package:pinger/widgets/separated_sliver_list.dart';

class ResultDetailsMore extends StatefulWidget {
  final List<PingResult> results;

  const ResultDetailsMore({Key key, @required this.results}) : super(key: key);

  @override
  _ResultDetailsMoreState createState() => _ResultDetailsMoreState();
}

class _ResultDetailsMoreState extends State<ResultDetailsMore> {
  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      SeparatedSliverList(
        itemCount: widget.results.length,
        itemBuilder: (_, index) {
          final item = widget.results[index];
          return PingResultItem(
            result: item,
            onTap: () => push(ResultDetailsPage(result: item)),
          );
        },
        separatorBuilder: (_, __) => Divider(),
      )
    ]);
  }
}
