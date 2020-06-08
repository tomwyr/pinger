import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:pinger/model/user_settings.dart';

@injectable
class PingService {
  Stream<double> ping(String host, PingSettings settings) async* {
    final args = _parseArgs(settings);
    final count = settings.count ?? double.infinity;
    for (var i = 0; i < count; i++) {
      final result = await Process.run('ping', [...args, host]);
      try {
        yield _parseResult(result);
      } on PingError catch (e, stackTrace) {
        yield* Future<double>.error(e, stackTrace).asStream();
      }
      // Skip last interval to send done signal immidiately
      if (i < count - 1) {
        await Future.delayed(Duration(seconds: settings.interval));
      }
    }
  }

  List<String> _parseArgs(PingSettings settings) {
    return <String, String>{
      '-c': '1',
      '-W': settings.timeout.toString(),
      '-s': settings.packetSize.toString(),
    }.entries.expand((it) => [it.key, it.value]).toList();
  }

  double _parseResult(ProcessResult result) {
    final didSucceed =
        (result.stderr as String ?? "").isEmpty && result.stdout != null;
    if (!didSucceed) throw PingError.REQUEST_FAILED;
    final value =
        RegExp(r"time=(\d+(\.\d+)?) ms").firstMatch(result.stdout)?.group(1);
    if (value == null) {
      final didLosePacket =
          (result.stdout as String).contains("100% packet loss");
      if (didLosePacket) throw PingError.PACKET_LOST;
      throw PingError.INVALID_FORMAT;
    }
    return double.parse(value);
  }
}

enum PingError {
  REQUEST_FAILED,
  PACKET_LOST,
  INVALID_FORMAT,
}
