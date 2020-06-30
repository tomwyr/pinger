import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/hosts_page.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/utils/host_tap_handler.dart';

class RecentsPage extends StatefulWidget {
  @override
  _RecentsPageState createState() => _RecentsPageState();
}

class _RecentsPageState extends BaseState<RecentsPage> with HostTapHandler {
  final HostsStore _hostsStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final stats = _hostsStore.localStats;
      return HostsPage(
        title: S.current.recentsPageTitle,
        hosts: stats.keys.toList(),
        getTrailingLabel: (it) =>
            FormatUtils.getSinceNowLabel(stats[it].pingTime),
        removeHosts: _hostsStore.removeStats,
        onHostSelected: (it) => onHostTap(_pingStore, it),
      );
    });
  }
}
