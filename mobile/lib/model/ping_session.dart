import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';

part 'ping_session.freezed.dart';

@freezed
class PingSession with _$PingSession {
  PingSession._();

  factory PingSession({
    required String host,
    required PingStatus status,
    required PingSettings settings,
    List<int?>? values,
    DateTime? startTime,
  }) = _PingSession;

  late final PingStats? stats = values != null ? PingStats.fromValues(values!) : null;
}

enum PingStatus {
  initial,
  quickCheckStarted,
  quickCheckLocked,
  sessionStarted,
  sessionPaused,
  sessionDone,
}

extension PingStatusExtensions on PingStatus? {
  bool get isNull => this == null;

  bool get isInitial => this == PingStatus.initial;
  bool get isQuickCheckStarted => this == PingStatus.quickCheckStarted;
  bool get isQuickCheckLocked => this == PingStatus.quickCheckLocked;
  bool get isSessionStarted => this == PingStatus.sessionStarted;
  bool get isSessionPaused => this == PingStatus.sessionPaused;
  bool get isSessionDone => this == PingStatus.sessionDone;

  bool get isQuickCheck =>
      this == PingStatus.quickCheckStarted || this == PingStatus.quickCheckLocked;
  bool get isStarted =>
      this == PingStatus.quickCheckStarted ||
      this == PingStatus.quickCheckLocked ||
      this == PingStatus.sessionStarted;
  bool get isSession =>
      this == PingStatus.sessionStarted ||
      this == PingStatus.sessionPaused ||
      this == PingStatus.sessionDone;
}
