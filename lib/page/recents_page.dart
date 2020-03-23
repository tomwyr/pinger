import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/utils/format_utils.dart';

class RecentsPage extends StatefulWidget {
  @override
  _RecentsPageState createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {
  final HostsStore _hostsStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text("Recent hosts"),
      ),
      body: Observer(builder: (_) {
        final stats = _hostsStore.stats;
        return ListView.builder(
          itemCount: stats.length,
          itemBuilder: (_, index) {
            final item = stats[index];
            return ListTile(
              title: Text(item.host),
              trailing: Text(FormatUtils.getSinceNowLabel(item.pingTime)),
              onTap: () {
                _pingStore.initSession(item.host);
                pushReplacement(PingPage());
              },
            );
          },
        );
      }),
    );
  }
}
