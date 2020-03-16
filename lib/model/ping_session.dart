import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_result.dart';

part 'ping_session.freezed.dart';

@freezed
abstract class PingSession with _$PingSession {
  factory PingSession({
    @required List<double> values,
    @required PingStatus status,
    @required PingHost host,
    DateTime startTime,
  }) = _PingSession;
}

enum PingStatus {
  initial,
  checkStarted,
  checkDone,
  sessionStarted,
  sessionPaused,
  sessionDone,
}
