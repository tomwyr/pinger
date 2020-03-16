import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:pinger/model/user_settings.dart';

@injectable
class PingService {
  Stream<double> ping(String host, PingSettings settings) {
    StreamController<double> controller;
    controller = StreamController<double>(
      onListen: () async {
        final args = _parseArgs(settings);
        final count = settings.count ?? double.infinity;
        for (var i = 0; i < count; i++) {
          if (controller.isClosed) break;
          final result = await Process.run('ping $host', args);
          if (controller.isClosed) break;
          controller.add(_parseResult(result));
          await Future.delayed(Duration(seconds: settings.sendInterval));
        }
      },
      onCancel: () => controller.close(),
    );
    return controller.stream;
  }

  List<String> _parseArgs(PingSettings settings) {
    return <String, String>{
      '-c': '1',
      '-W': settings.timeout.toString(),
      '-s': settings.packetSize.toString(),
    }.entries.expand((it) => [it.key, it.value]).toList();
  }

  double _parseResult(ProcessResult result) {
    if (result.stderr != null || result.stdout == null) return null;
    final match = RegExp('time=(\\d+\\.\\d+) ms').firstMatch(result.stdout);
    return match != null ? double.parse(match.group(1)) : null;
  }
}
