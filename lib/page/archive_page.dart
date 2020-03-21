import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/page/result_details_page.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/widgets/ping_session_item.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage>
    with SingleTickerProviderStateMixin {
  final ArchiveStore _archiveStore = Injector.resolve();

  ArchiveViewType _viewType = ArchiveViewType.list;
  AnimationController _animator;
  String _hostName;

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Observer(
          builder: (_) => _buildBody(_archiveStore.results),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_viewType == ArchiveViewType.host) {
      setState(() => _viewType = ArchiveViewType.groups);
      return false;
    }
    return true;
  }

  Widget _buildAppBar() {
    return _viewType == ArchiveViewType.host
        ? AppBar(
            leading: BackButton(onPressed: () {
              setState(() => _viewType = ArchiveViewType.groups);
            }),
            title: Text(_hostName),
          )
        : AppBar(
            leading: BackButton(),
            title: Text("Archive"),
            actions: <Widget>[_buildViewTypeIcon()],
          );
  }

  Widget _buildViewTypeIcon() {
    return GestureDetector(
      onTap: () => setState(() {
        if (_viewType == ArchiveViewType.list) {
          _viewType = ArchiveViewType.groups;
          _animator.forward();
        } else {
          _viewType = ArchiveViewType.list;
          _animator.reverse();
        }
      }),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedIcon(
          icon: AnimatedIcons.view_list,
          progress: _animator,
        ),
      ),
    );
  }

  Widget _buildBody(List<PingResult> results) {
    if (results == null) return Center(child: CircularProgressIndicator());
    if (results.isEmpty) return _buildEmptyResults();
    switch (_viewType) {
      case ArchiveViewType.list:
        return _buildResultsList(results);
      case ArchiveViewType.groups:
        return _buildResultsGroups(results);
      case ArchiveViewType.host:
        return _buildHostList(
            results.where((it) => it.host.name == _hostName).toList());
    }
    throw StateError("Unrecognized $ArchiveViewType selected: $_viewType.");
  }

  Widget _buildHostList(List<PingResult> results) {
    return ListView.separated(
      itemCount: results.length,
      itemBuilder: (_, index) {
        final item = results[index];
        return PingResultItem(
          result: item,
          onTap: () => push(ResultDetailsPage(result: item)),
        );
      },
      separatorBuilder: (_, __) => Divider(),
    );
  }

  Widget _buildEmptyResults() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(children: <Widget>[
        Spacer(),
        Image(image: Images.boxEmpty, height: 144.0),
        Container(height: 32.0),
        Text(
          "There't nothing here yet",
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        Container(height: 32.0),
        Text(
          "Save results after pinging a host or let the app make it each time automatically in settings",
          textAlign: TextAlign.center,
        ),
        Spacer(),
        RaisedButton(
          child: Text("Start now"),
          onPressed: () => pushAndRemoveUntil(SearchPage(), (it) => it.isFirst),
        ),
        Container(height: 64.0),
      ]),
    );
  }

  Widget _buildResultsList(List<PingResult> results) {
    return ListView.separated(
      itemCount: results.length,
      itemBuilder: (_, index) {
        final item = results[index];
        return ListTile(
          onTap: () => push(ResultDetailsPage(result: item)),
          leading: Icon(Icons.language),
          title: Text(
            item.host.name,
            style: TextStyle(fontSize: 18.0),
            maxLines: 1,
          ),
          trailing: PingResultItemTrailing(result: item),
        );
      },
      separatorBuilder: (_, __) => Divider(),
    );
  }

  Widget _buildResultsGroups(List<PingResult> results) {
    final countsMap = <String, int>{};
    results.forEach((it) => !countsMap.containsKey(it.host)
        ? countsMap[it.host.name] = 1
        : ++countsMap[it.host.name]);
    final hostCounts = countsMap.entries.toList()
      ..sort((e1, e2) => e2.value - e1.value);
    return ListView.separated(
      itemCount: hostCounts.length,
      itemBuilder: (_, index) {
        final item = hostCounts[index];
        return ListTile(
          onTap: () => setState(() {
            _viewType = ArchiveViewType.host;
            _hostName = item.key;
          }),
          leading: Icon(Icons.language),
          title: Text(item.key, style: TextStyle(fontSize: 18.0)),
          trailing: SizedBox(
            width: 72.0,
            child: Text(
              "${item.value} results",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => Divider(),
    );
  }
}

enum ArchiveViewType { list, groups, host }
