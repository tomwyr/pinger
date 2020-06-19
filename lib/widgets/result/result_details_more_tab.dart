import 'package:flutter/material.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/common/collapsing_tab_layout.dart';
import 'package:pinger/widgets/common/scroll_edge_gradient.dart';
import 'package:pinger/widgets/common/separated_sliver_list.dart';
import 'package:pinger/widgets/result/result_details_prompt_tab.dart';
import 'package:pinger/widgets/tiles/result_tile.dart';

class ResultDetailsMoreTab extends StatefulWidget {
  final List<PingResult> results;
  final ValueChanged<PingResult> onItemSelected;
  final VoidCallback onStartPingPressed;

  const ResultDetailsMoreTab({
    Key key,
    @required this.results,
    @required this.onItemSelected,
    @required this.onStartPingPressed,
  }) : super(key: key);

  @override
  _ResultDetailsMoreTabState createState() => _ResultDetailsMoreTabState();
}

class _ResultDetailsMoreTabState extends State<ResultDetailsMoreTab> {
  @override
  Widget build(BuildContext context) {
    return ScrollEdgeGradient(
      color: R.colors.canvas,
      sliverOverlap: kToolbarHeight + kTextTabBarHeight,
      builder: (controller) => CollapsingTabLayoutItem(
        controller: controller,
        slivers: <Widget>[
          if (widget.results.isEmpty)
            ResultDetailsPromptTab(
              image: Images.undrawEmpty,
              title: S.current.nothingToShowTitle,
              description: S.current.resultOtherEmptyDesc,
              buttonLabel: S.current.startNowButtonLabel,
              onButtonPressed: widget.onStartPingPressed,
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SeparatedSliverList(
                itemCount: widget.results.length,
                itemBuilder: (_, index) {
                  final item = widget.results[index];
                  return ResultTile(
                    result: item,
                    type: ResultTileType.detailed,
                    onPressed: () => widget.onItemSelected(item),
                  );
                },
                separatorBuilder: (_, __) => Divider(),
              ),
            )
        ],
      ),
    );
  }
}
