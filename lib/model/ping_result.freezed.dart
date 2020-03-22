// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ping_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

PingResult _$PingResultFromJson(Map<String, dynamic> json) {
  return _PingResult.fromJson(json);
}

mixin _$PingResult {
  int get id;
  PingHost get host;
  PingSettings get settings;
  DateTime get startTime;
  Duration get duration;
  List<double> get values;

  PingResult copyWith(
      {int id,
      PingHost host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<double> values});

  Map<String, dynamic> toJson();
}

class _$PingResultTearOff {
  const _$PingResultTearOff();

  _PingResult call(
      {int id,
      @required PingHost host,
      @required PingSettings settings,
      @required DateTime startTime,
      @required Duration duration,
      @required List<double> values}) {
    return _PingResult(
      id: id,
      host: host,
      settings: settings,
      startTime: startTime,
      duration: duration,
      values: values,
    );
  }
}

const $PingResult = _$PingResultTearOff();

@JsonSerializable()
class _$_PingResult implements _PingResult {
  _$_PingResult(
      {this.id,
      @required this.host,
      @required this.settings,
      @required this.startTime,
      @required this.duration,
      @required this.values})
      : assert(host != null),
        assert(settings != null),
        assert(startTime != null),
        assert(duration != null),
        assert(values != null);

  factory _$_PingResult.fromJson(Map<String, dynamic> json) =>
      _$_$_PingResultFromJson(json);

  @override
  final int id;
  @override
  final PingHost host;
  @override
  final PingSettings settings;
  @override
  final DateTime startTime;
  @override
  final Duration duration;
  @override
  final List<double> values;
  bool _didstats = false;
  PingStats _stats;

  @override
  PingStats get stats {
    if (_didstats == false) {
      _didstats = true;
      _stats = PingStats.fromValues(values);
    }
    return _stats;
  }

  @override
  String toString() {
    return 'PingResult(id: $id, host: $host, settings: $settings, startTime: $startTime, duration: $duration, values: $values, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(values);

  @override
  _$_PingResult copyWith({
    Object id = freezed,
    Object host = freezed,
    Object settings = freezed,
    Object startTime = freezed,
    Object duration = freezed,
    Object values = freezed,
  }) {
    return _$_PingResult(
      id: id == freezed ? this.id : id as int,
      host: host == freezed ? this.host : host as PingHost,
      settings: settings == freezed ? this.settings : settings as PingSettings,
      startTime: startTime == freezed ? this.startTime : startTime as DateTime,
      duration: duration == freezed ? this.duration : duration as Duration,
      values: values == freezed ? this.values : values as List<double>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingResultToJson(this);
  }
}

abstract class _PingResult implements PingResult {
  factory _PingResult(
      {int id,
      @required PingHost host,
      @required PingSettings settings,
      @required DateTime startTime,
      @required Duration duration,
      @required List<double> values}) = _$_PingResult;

  factory _PingResult.fromJson(Map<String, dynamic> json) =
      _$_PingResult.fromJson;

  @override
  int get id;
  @override
  PingHost get host;
  @override
  PingSettings get settings;
  @override
  DateTime get startTime;
  @override
  Duration get duration;
  @override
  List<double> get values;

  @override
  _PingResult copyWith(
      {int id,
      PingHost host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<double> values});
}

PingHost _$PingHostFromJson(Map<String, dynamic> json) {
  return _PingHost.fromJson(json);
}

mixin _$PingHost {
  String get name;
  String get ip;

  PingHost copyWith({String name, String ip});

  Map<String, dynamic> toJson();
}

class _$PingHostTearOff {
  const _$PingHostTearOff();

  _PingHost call({@required String name, String ip}) {
    return _PingHost(
      name: name,
      ip: ip,
    );
  }
}

const $PingHost = _$PingHostTearOff();

@JsonSerializable()
class _$_PingHost implements _PingHost {
  _$_PingHost({@required this.name, this.ip}) : assert(name != null);

  factory _$_PingHost.fromJson(Map<String, dynamic> json) =>
      _$_$_PingHostFromJson(json);

  @override
  final String name;
  @override
  final String ip;

  @override
  String toString() {
    return 'PingHost(name: $name, ip: $ip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingHost &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.ip, ip) ||
                const DeepCollectionEquality().equals(other.ip, ip)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(ip);

  @override
  _$_PingHost copyWith({
    Object name = freezed,
    Object ip = freezed,
  }) {
    return _$_PingHost(
      name: name == freezed ? this.name : name as String,
      ip: ip == freezed ? this.ip : ip as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingHostToJson(this);
  }
}

abstract class _PingHost implements PingHost {
  factory _PingHost({@required String name, String ip}) = _$_PingHost;

  factory _PingHost.fromJson(Map<String, dynamic> json) = _$_PingHost.fromJson;

  @override
  String get name;
  @override
  String get ip;

  @override
  _PingHost copyWith({String name, String ip});
}

PingStats _$PingStatsFromJson(Map<String, dynamic> json) {
  return _PingStats.fromJson(json);
}

mixin _$PingStats {
  double get min;
  double get max;
  double get mean;

  PingStats copyWith({double min, double max, double mean});

  Map<String, dynamic> toJson();
}

class _$PingStatsTearOff {
  const _$PingStatsTearOff();

  _PingStats call(
      {@required double min, @required double max, @required double mean}) {
    return _PingStats(
      min: min,
      max: max,
      mean: mean,
    );
  }
}

const $PingStats = _$PingStatsTearOff();

@JsonSerializable()
class _$_PingStats implements _PingStats {
  const _$_PingStats(
      {@required this.min, @required this.max, @required this.mean})
      : assert(min != null),
        assert(max != null),
        assert(mean != null);

  factory _$_PingStats.fromJson(Map<String, dynamic> json) =>
      _$_$_PingStatsFromJson(json);

  @override
  final double min;
  @override
  final double max;
  @override
  final double mean;

  @override
  String toString() {
    return 'PingStats(min: $min, max: $max, mean: $mean)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingStats &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.mean, mean) ||
                const DeepCollectionEquality().equals(other.mean, mean)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(mean);

  @override
  _$_PingStats copyWith({
    Object min = freezed,
    Object max = freezed,
    Object mean = freezed,
  }) {
    return _$_PingStats(
      min: min == freezed ? this.min : min as double,
      max: max == freezed ? this.max : max as double,
      mean: mean == freezed ? this.mean : mean as double,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingStatsToJson(this);
  }
}

abstract class _PingStats implements PingStats {
  const factory _PingStats(
      {@required double min,
      @required double max,
      @required double mean}) = _$_PingStats;

  factory _PingStats.fromJson(Map<String, dynamic> json) =
      _$_PingStats.fromJson;

  @override
  double get min;
  @override
  double get max;
  @override
  double get mean;

  @override
  _PingStats copyWith({double min, double max, double mean});
}
