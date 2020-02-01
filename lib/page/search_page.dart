import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/store/hosts_store.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _hostsStore = HostsStore();

  TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: _inputController.text.isEmpty ? 4.0 : 0.0,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: null,
        ),
        title: TextField(
          autofocus: true,
          controller: _inputController,
          decoration: InputDecoration(
            hintText: "Type host to search",
          ),
          onChanged: _onQueryChanged,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear, color: Colors.black),
            onPressed: _onClearPressed,
          ),
        ],
      ),
      body: Column(children: <Widget>[
        if (_inputController.text.isNotEmpty)
          Material(
            elevation: 4.0,
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.language),
              title: Text(_inputController.text),
              contentPadding: EdgeInsets.only(left: 16.0, right: 12.0),
              trailing: Icon(Icons.arrow_forward, color: Colors.black),
            ),
          ),
        Expanded(
          child: Observer(builder: (_) {
            final hosts = _hostsStore.hosts;
            if (_inputController.text.isEmpty)
              return Center(child: Text("Type something"));
            if (_hostsStore.isLoading)
              return Center(child: CircularProgressIndicator());
            if (hosts == null) return Center(child: Text("Type something"));
            if (hosts.isEmpty)
              return Center(child: Text("No results for given query"));
            return ListView.builder(
              itemCount: hosts.length,
              itemBuilder: (_, index) => _buildHostItem(hosts[index]),
            );
          }),
        ),
      ]),
    );
  }

  void _onQueryChanged(String query) {
    if (query.isNotEmpty) {
      _hostsStore.search(query);
    }
    rebuild();
  }

  void _onClearPressed() {
    if (_inputController.text.isNotEmpty) {
      _inputController.clear();
      rebuild();
    } else {
      pop();
    }
  }

  Widget _buildHostItem(HostItem item) {
    final color = Colors.lightBlueAccent;
    return ListTile(
      onTap: () {},
      leading: Icon(Icons.language, size: 24.0),
      title: Text(item.name, style: TextStyle(fontSize: 18.0)),
      subtitle: Row(children: <Widget>[
        Icon(Icons.whatshot, size: 12.0, color: color),
        Container(width: 8.0),
        Expanded(
          child: Container(
            height: 4.0,
            child: LinearProgressIndicator(
              value: item.popularity,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ),
      ]),
    );
  }
}
