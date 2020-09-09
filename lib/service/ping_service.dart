import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:pinger/model/user_settings.dart';

@injectable
class PingService {
  PingService(this._pingCommand);

  final PingCommand _pingCommand;

  Stream<double> ping(String host, PingSettings settings) async* {
    final interval = Duration(seconds: settings.interval);
    var currentCount = 0;
    while (_shouldPingNext(settings, currentCount)) {
      if (currentCount > 0) await Future.delayed(interval);
      yield* _pingNext(host, settings);
      ++currentCount;
    }
  }

  bool _shouldPingNext(PingSettings settings, int currentCount) {
    return settings.count.when(
      finite: (it) => currentCount < it,
      infinite: () => true,
    );
  }

  Stream<double> _pingNext(String host, PingSettings settings) async* {
    try {
      yield await _pingCommand.execute(host, settings);
    } catch (e, stackTrace) {
      yield* Future<double>.error(e, stackTrace).asStream();
    }
  }
}

@injectable
abstract class PingCommand {
  Future<double> execute(String host, PingSettings settings);

  const PingCommand();

  @factoryMethod
  factory PingCommand.create() {
    if (Platform.isAndroid) return BashPingCommand();
    if (Platform.isIOS) return SimplePingCommand();
    throw UnsupportedError("Unhandled platform.");
  }
}

class BashPingCommand extends PingCommand {
  @override
  Future<double> execute(String host, PingSettings settings) async {
    final args = _parseArgs(settings);
    final result = await Process.run('ping', [...args, host]);
    return _parseResult(result);
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

class SimplePingCommand extends PingCommand {
  final MethodChannel _channel = MethodChannel('com.tomwyr.pinger/simplePing');

  @override
  Future<double> execute(String host, PingSettings settings) async {
    try {
      return await _channel.invokeMethod('ping', {
        'hostName': host,
        'packetSize': settings.packetSize,
        'timeout': settings.timeout,
      });
    } on PlatformException {
      throw PingError.REQUEST_FAILED;
    }
  }
}

enum PingError {
  REQUEST_FAILED,
  PACKET_LOST,
  INVALID_FORMAT,
}
