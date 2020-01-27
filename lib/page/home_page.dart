import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/archive_page.dart';
import 'package:pinger/page/intro_page.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/page/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: _buildNoSuggestions(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.tune),
        onPressed: () => push(SettingsPage()),
      ),
      title: Text("Pinger"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.unarchive),
          onPressed: () => push(ArchivePage()),
        ),
      ],
    );
  }

  Widget _buildNoSuggestions() {
    return Column(children: <Widget>[
      _buildSearchBar(),
      Spacer(),
      _buildNoSuggestionsInfo(),
      Spacer(),
      RaisedButton(
        child: Text("Show intro"),
        onPressed: () => push(IntroPage()),
      ),
    ]);
  }

  Widget _buildNoSuggestionsInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset('assets/box_empty.png', height: 144.0),
        Container(height: 24.0),
        Text(
          "Looks like there's nothing here yet",
          style: TextStyle(fontSize: 18.0),
        ),
        Container(height: 24.0),
        Text(
          "Use search field above to choose host to ping or see intro explaining app concept",
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        OutlineButton(
          onPressed: () => push(SearchPage()),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Container(
            height: 48.0,
            width: double.infinity,
            padding: EdgeInsets.only(left: 48.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter host to ping...',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 48.0,
          height: 48.0,
          child: RawMaterialButton(
            fillColor: Colors.blue,
            shape: CircleBorder(),
            child: Icon(Icons.search, color: Colors.white),
            onPressed: () => push(SearchPage()),
          ),
        ),
      ],
    );
  }
}
