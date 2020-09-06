import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';

part 'ping_session.freezed.dart';

@freezed
abstract class PingSession with _$PingSession {
  factory PingSession({
    @required String host,
    @required PingStatus status,
    @required PingSettings settings,
    List<int> values,
    DateTime startTime,
  }) = _PingSession;

  @late
  PingStats get stats => values != null ? PingStats.fromValues(values) : null;
}

enum PingStatus {
  initial,
  quickCheck,
  sessionStarted,
  sessionPaused,
  sessionDone,
}

extension PingStatusExtensions on PingStatus {
  bool get isNull => this == null;

  bool get isInitial => this == PingStatus.initial;
  bool get isQuickCheck => this == PingStatus.quickCheck;
  bool get isSessionStarted => this == PingStatus.sessionStarted;
  bool get isSessionPaused => this == PingStatus.sessionPaused;
  bool get isSessionDone => this == PingStatus.sessionDone;

  bool get isStarted =>
      this == PingStatus.quickCheck || this == PingStatus.sessionStarted;
  bool get isSession =>
      this == PingStatus.sessionStarted ||
      this == PingStatus.sessionPaused ||
      this == PingStatus.sessionDone;
}
