import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/page/base_page.dart';
import 'package:pinger/page/result_details_page.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/widgets/common/animated_ink_icon.dart';
import 'package:pinger/widgets/common/scroll_edge_gradient.dart';
import 'package:pinger/widgets/tiles/host_icon_tile.dart';
import 'package:pinger/widgets/tiles/result_tile.dart';
import 'package:pinger/widgets/tiles/results_group_tile.dart';

enum ArchiveViewType { list, groups, host }

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends BaseState<ArchivePage> {
  final ArchiveStore _archiveStore = Injector.resolve();

  ArchiveViewType _viewType = ArchiveViewType.list;
  String _selectedHost;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_viewType == ArchiveViewType.host) {
          setState(() => _viewType = ArchiveViewType.groups);
          return false;
        }
        return true;
      },
      child: Observer(
        builder: (_) => Scaffold(
          appBar: _buildAppBar(_archiveStore.localResults.isNotEmpty),
          body: _buildBody(_archiveStore.localResults),
        ),
      ),
    );
  }

  Widget _buildAppBar(bool hasResults) {
    return _viewType == ArchiveViewType.host
        ? AppBar(
            leading: BackButton(onPressed: () {
              setState(() => _viewType = ArchiveViewType.groups);
            }),
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                HostIconTile(host: _selectedHost, isRaised: false),
                Container(width: 12.0),
                Text(
                  _selectedHost,
                  style: R.styles.text.copyWith(fontSize: 18.0),
                ),
              ],
            ),
          )
        : AppBar(
            leading: CloseButton(),
            centerTitle: true,
            title: Text(S.current.archivePageTitle),
            actions: <Widget>[
              if (hasResults)
                AnimatedInkIcon(
                  icon: AnimatedIcons.view_list,
                  transition: _viewType == ArchiveViewType.groups,
                  onPressed: () => setState(
                    () => _viewType = _viewType == ArchiveViewType.list
                        ? ArchiveViewType.groups
                        : ArchiveViewType.list,
                  ),
                )
            ],
          );
  }

  Widget _buildBody(List<PingResult> results) {
    if (results == null) return Container();
    if (results.isEmpty) return _buildEmptyResults();
    switch (_viewType) {
      case ArchiveViewType.groups:
        return _buildResultsGroups(_groupHosts(results));
      case ArchiveViewType.list:
        return _buildResultsList(results, ResultTileType.regular);
      case ArchiveViewType.host:
        final hostResults =
            results.where((it) => it.host == _selectedHost).toList();
        return _buildResultsList(hostResults, ResultTileType.detailed);
    }
    throw StateError("Unrecognized $ArchiveViewType selected: $_viewType.");
  }

  Widget _buildEmptyResults() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(children: <Widget>[
        Spacer(),
        Image(image: Images.undrawEmpty, width: 144.0, height: 144.0),
        Container(height: 32.0),
        Text(
          S.current.nothingToShowTitle,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(height: 32.0),
        Text(
          S.current.archiveEmptyDesc,
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        ButtonTheme.fromButtonThemeData(
          data: R.themes.raisedButton,
          child: RaisedButton(
            child: Text(S.current.startNowButtonLabel),
            onPressed: () =>
                pushAndRemoveUntil(SearchPage(), (it) => it.isFirst),
          ),
        ),
        Container(height: 64.0),
      ]),
    );
  }

  List<MapEntry<String, int>> _groupHosts(List<PingResult> results) {
    final map = <String, int>{};
    results.forEach((it) => map.update(
          it.host,
          (value) => ++value,
          ifAbsent: () => 1,
        ));
    return map.entries.toList()..sort((e1, e2) => e2.value - e1.value);
  }

  Widget _buildResultsGroups(List<MapEntry<String, int>> groups) {
    return ScrollEdgeGradient(
      color: R.colors.canvas,
      builder: (controller) => GridView.builder(
        controller: controller,
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: groups.length,
        itemBuilder: (_, index) => ResultsGroupTile(
          host: groups[index].key,
          resultsCount: groups[index].value,
          onPressed: () => setState(() {
            _viewType = ArchiveViewType.host;
            _selectedHost = groups[index].key;
          }),
        ),
      ),
    );
  }

  Widget _buildResultsList(List<PingResult> results, ResultTileType type) {
    return ScrollEdgeGradient(
      color: R.colors.canvas,
      builder: (controller) => ListView.builder(
        controller: controller,
        padding: const EdgeInsets.all(16.0),
        itemCount: results.length,
        itemBuilder: (_, index) => Padding(
          padding:
              index == 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 16.0),
          child: ResultTile(
            result: results[index],
            type: type,
            onPressed: () => push(ResultDetailsPage(result: results[index])),
          ),
        ),
      ),
    );
  }
}
