import 'package:freezed_annotation/freezed_annotation.dart';

part 'host_stats.freezed.dart';
part 'host_stats.g.dart';

@freezed
abstract class HostStats with _$HostStats {
  factory HostStats({
    @required String host,
    @required int pingCount,
    @required DateTime pingTime,
  }) = _HostStats;

  factory HostStats.fromJson(Map<String, dynamic> json) =>
      _$HostStatsFromJson(json);
}
