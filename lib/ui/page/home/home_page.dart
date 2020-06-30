import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/page/archive_page.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/home/home_host_suggestions.dart';
import 'package:pinger/ui/page/intro_page.dart';
import 'package:pinger/ui/page/search_page.dart';
import 'package:pinger/ui/page/settings/settings_page.dart';
import 'package:pinger/ui/shared/info_section.dart';
import 'package:pinger/utils/host_tap_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> with HostTapHandler {
  final HostsStore _hostsStore = Injector.resolve();
  final FavoritesStore _favoritesStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();
  final SettingsStore _settingsStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ignore resize caused by hiding keyboard
      // when navigating back from search page.
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => push(SettingsPage()),
        ),
        title: Text(S.current.homePageTitle),
        centerTitle: true,
        actions: <Widget>[
          SizedBox.fromSize(
            size: Size.square(56.0),
            child: IconButton(
              icon: Icon(Icons.unarchive),
              onPressed: () => push(ArchivePage()),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          final shouldShowIntroPrompt = !_settingsStore.didShowIntro &&
              _pingStore.currentSession == null &&
              _favoritesStore.items.isEmpty &&
              _hostsStore.stats.isEmpty;
          return shouldShowIntroPrompt
              ? _buildIntroContent(_settingsStore.notifyDidShowIntro)
              : HomeHostSuggestions(
                  session: _pingStore.currentSession,
                  favorites: _favoritesStore.items,
                  popular: _hostsStore.hosts.maybeWhen(
                    data: (data) => data.take(5).map((it) => it.name).toList(),
                    orElse: () => [],
                  ),
                  stats: _hostsStore.stats,
                  searchBar: _buildSearchBar(),
                  onItemPressed: (it) => onHostTap(_pingStore, it),
                );
        },
      ),
    );
  }

  Widget _buildIntroContent(VoidCallback onIntroDone) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(children: <Widget>[
        Expanded(
          child: InfoSection(
            image: Images.undrawRoadSign,
            title: S.current.homeIntroTitle,
            description: S.current.homeIntroDesc,
          ),
        ),
        ButtonTheme.fromButtonThemeData(
          data: R.themes.raisedButton,
          child: RaisedButton(
            child: Text(S.current.showIntroButtonLabel),
            onPressed: () => push(IntroPage()).then((_) => onIntroDone()),
          ),
        ),
        Container(height: 8.0),
        ButtonTheme.fromButtonThemeData(
          data: R.themes.flatButton,
          child: FlatButton(
            child: Text(S.current.skipButtonLabel),
            onPressed: onIntroDone,
          ),
        ),
        Container(height: 16.0),
      ]),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: TextStyle(fontSize: 18.0),
      readOnly: true,
      onTap: () => push(SearchPage()),
      decoration: InputDecoration(
        hintText: S.current.searchHostHint,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        fillColor: R.colors.grayLight,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(Icons.search, color: R.colors.gray),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
