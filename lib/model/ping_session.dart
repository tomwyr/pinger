import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_result.dart';

part 'ping_session.freezed.dart';

@freezed
abstract class PingSession with _$PingSession {
  factory PingSession({
    @required PingHost host,
    @required PingStatus status,
    @Default([]) List<double> values,
    DateTime startTime,
  }) = _PingSession;

  @late
  PingStats get stats =>
      values.isNotEmpty ? PingStats.fromValues(values) : null;
}

enum PingStatus {
  initial,
  quickCheckStarted,
  quickCheckDone,
  sessionStarted,
  sessionPaused,
  sessionDone,
}
