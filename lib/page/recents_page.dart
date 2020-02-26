import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/store/history_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/utils/format_utils.dart';

class RecentsPage extends StatefulWidget {
  @override
  _RecentsPageState createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {
  final HistoryStore _historyStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text("Recent hosts"),
      ),
      body: Observer(builder: (_) {
        final historyHosts = _historyStore.items;
        return ListView.builder(
          itemCount: historyHosts.length,
          itemBuilder: (_, index) {
            final item = historyHosts[index];
            return ListTile(
              title: Text(item.host),
              trailing: Text(FormatUtils.getSinceNowLabel(item.timestamp)),
              onTap: () {
                _pingStore.start(item.host);
                pushReplacement(PingPage());
              },
            );
          },
        );
      }),
    );
  }
}
