import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/common/flex_child_scroll_view.dart';
import 'package:pinger/ui/common/scroll_edge_gradient.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/shared/info_section.dart';
import 'package:pinger/ui/shared/three_bounce.dart';
import 'package:pinger/ui/shared/tiles/host_tile.dart';
import 'package:pinger/utils/host_tap_handler.dart';

class SearchPage extends StatefulWidget {
  final String initialQuery;

  const SearchPage({Key key, this.initialQuery}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends BaseState<SearchPage> with HostTapHandler {
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
      PingerApp.router.pop();
    }
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
                onPressed: () => onHostTap(_pingStore, value),
              ),
            ),
          child,
        ]),
        child: Expanded(child: _buildSearchResults()),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Observer(
      builder: (_) => _hostsStore.hosts.when(
        data: (_) => _hostsStore.searchResults.isNotEmpty
            ? _buildResultsList(_hostsStore.searchResults)
            : _buildNoResults(
                Images.undrawVoid,
                S.current.searchResultsEmptyTitle,
                S.current.searchResultsEmptyDesc,
              ),
        loading: () => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ThreeBounce(color: R.colors.secondary),
          ),
        ),
        error: () => _buildNoResults(
          Images.undrawServerDown,
          S.current.dataFetchFailedTitle,
          S.current.dataFetchFailedDesc,
          action: ButtonTheme.fromButtonThemeData(
            data: R.themes.raisedButton,
            child: RaisedButton(
              onPressed: _hostsStore.fetchHosts,
              child: Text(S.current.tryAgainButtonLabel),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoResults(AssetImage image, String title, String description,
      {Widget action}) {
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
              InfoSection(
                image: image,
                title: title,
                description: description,
              ),
              if (action != null)
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: action,
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
            onPressed: () => onHostTap(_pingStore, results[index].name),
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
          FilteringTextInputFormatter.allow(RegExp(r"^[A-Za-z0-9-\.]+")),
          FilteringTextInputFormatter.deny(RegExp(r"^\.")),
          FilteringTextInputFormatter.deny("..", replacementString: "."),
          TextInputFormatter.withFunction(
            (_, value) => value.copyWith(text: value.text.toLowerCase()),
          )
        ],
        decoration: InputDecoration(
          hintText: S.current.searchHostHint,
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
