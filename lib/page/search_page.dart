import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/widgets/common/flex_child_scroll_view.dart';
import 'package:pinger/widgets/common/scroll_edge_gradient.dart';
import 'package:pinger/widgets/three_bounce.dart';
import 'package:pinger/widgets/tiles/host_tile.dart';

class SearchPage extends StatefulWidget {
  final String initialQuery;

  const SearchPage({Key key, this.initialQuery}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final HostsStore _hostsStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();

  ValueNotifier<String> _highlightHost;
  TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    final query = widget.initialQuery ?? "";
    _inputController = TextEditingController.fromValue(TextEditingValue(
      text: query,
      selection: TextSelection(baseOffset: 0, extentOffset: query.length),
    ));
    _highlightHost = ValueNotifier(query);
    _hostsStore.search(query);
  }

  @override
  void dispose() {
    _inputController.dispose();
    _highlightHost.dispose();
    super.dispose();
  }

  void _onQueryChanged(String query) {
    _hostsStore.search(query);
    _highlightHost.value =
        query.endsWith(".") ? query.substring(0, query.length - 1) : query;
  }

  void _onClearPressed() {
    if (_inputController.text.isNotEmpty) {
      _inputController.clear();
      _onQueryChanged("");
    } else {
      pop();
    }
  }

  void _onItemSelected(String host) {
    if (host != _pingStore.currentSession?.host) {
      _pingStore.initSession(host);
    }
    pushReplacement(PingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchBar(),
      body: ValueListenableBuilder<String>(
        valueListenable: _highlightHost,
        builder: (_, value, child) => Column(children: <Widget>[
          if (value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: HostTile(
                host: value,
                loadIcon: false,
                type: HostTileType.highlighted,
                onPressed: () => _onItemSelected(value),
              ),
            ),
          child,
        ]),
        child: Expanded(
          child: Observer(builder: (_) {
            if (_hostsStore.isLoading) return _buildSearchInProgress();
            final results = _hostsStore.searchResults;
            if (results.isEmpty) return _buildNoResults();
            return _buildResultsList(results);
          }),
        ),
      ),
    );
  }

  Widget _buildSearchInProgress() {
    return ScrollEdgeGradient(
      color: R.colors.canvas,
      builder: (controller) => SingleChildScrollView(
        controller: controller,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ThreeBounce(color: R.colors.secondary),
                Container(height: 40.0),
                Text(
                  "Looking for hosts ...",
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoResults() {
    return ScrollEdgeGradient(
      color: R.colors.canvas,
      builder: (controller) => FlexChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: 24.0),
              Image(
                image: Images.undrawVoid,
                width: 144.0,
                height: 144.0,
              ),
              Container(height: 48.0),
              Text(
                "No results found",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(height: 16.0),
              Text(
                "We could not find anything for given query but you can still use it as host",
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              Container(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultsList(List<HostItem> results) {
    return ScrollEdgeGradient(
      color: R.colors.canvas,
      builder: (controller) => ListView.builder(
        controller: controller,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: results.length,
        itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0.0 : 16.0),
          child: HostTile(
            host: results[index].name,
            onPressed: () => _onItemSelected(results[index].name),
            trailing: Container(
              width: 48.0,
              height: 16.0,
              decoration: BoxDecoration(
                border: Border.all(color: R.colors.primaryLight),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 48.0 * results[index].popularity,
                  color: R.colors.primaryLight.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildSearchBar() {
    return AppBar(
      leading: Icon(Icons.search, color: R.colors.gray),
      title: TextField(
        autofocus: true,
        controller: _inputController,
        onChanged: _onQueryChanged,
        style: TextStyle(fontSize: 18.0),
        inputFormatters: [
          WhitelistingTextInputFormatter(RegExp(r"^[A-Za-z0-9-\.]+")),
          BlacklistingTextInputFormatter(RegExp(r"^\.")),
          BlacklistingTextInputFormatter("..", replacementString: "."),
          TextInputFormatter.withFunction(
            (_, value) => value.copyWith(text: value.text.toLowerCase()),
          )
        ],
        decoration: InputDecoration(
          hintText: "Search host to ping",
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      actions: <Widget>[
        SizedBox.fromSize(
          size: Size.square(56.0),
          child: IconButton(
            icon: Icon(Icons.clear, color: R.colors.primaryLight),
            onPressed: _onClearPressed,
          ),
        ),
      ],
    );
  }
}
