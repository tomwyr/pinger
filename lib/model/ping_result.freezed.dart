// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ping_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PingResult _$PingResultFromJson(Map<String, dynamic> json) {
  return _PingResult.fromJson(json);
}

class _$PingResultTearOff {
  const _$PingResultTearOff();

  _PingResult call(
      {int id,
      @required PingHost host,
      @required PingSettings settings,
      @required DateTime startTime,
      @required Duration duration,
      @required List<double> values,
      @required PingStats stats}) {
    return _PingResult(
      id: id,
      host: host,
      settings: settings,
      startTime: startTime,
      duration: duration,
      values: values,
      stats: stats,
    );
  }
}

// ignore: unused_element
const $PingResult = _$PingResultTearOff();

mixin _$PingResult {
  int get id;
  PingHost get host;
  PingSettings get settings;
  DateTime get startTime;
  Duration get duration;
  List<double> get values;
  PingStats get stats;

  Map<String, dynamic> toJson();
  $PingResultCopyWith<PingResult> get copyWith;
}

abstract class $PingResultCopyWith<$Res> {
  factory $PingResultCopyWith(
          PingResult value, $Res Function(PingResult) then) =
      _$PingResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      PingHost host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<double> values,
      PingStats stats});

  $PingHostCopyWith<$Res> get host;
  $PingSettingsCopyWith<$Res> get settings;
  $PingStatsCopyWith<$Res> get stats;
}

class _$PingResultCopyWithImpl<$Res> implements $PingResultCopyWith<$Res> {
  _$PingResultCopyWithImpl(this._value, this._then);

  final PingResult _value;
  // ignore: unused_field
  final $Res Function(PingResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object host = freezed,
    Object settings = freezed,
    Object startTime = freezed,
    Object duration = freezed,
    Object values = freezed,
    Object stats = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      host: host == freezed ? _value.host : host as PingHost,
      settings:
          settings == freezed ? _value.settings : settings as PingSettings,
      startTime:
          startTime == freezed ? _value.startTime : startTime as DateTime,
      duration: duration == freezed ? _value.duration : duration as Duration,
      values: values == freezed ? _value.values : values as List<double>,
      stats: stats == freezed ? _value.stats : stats as PingStats,
    ));
  }

  @override
  $PingHostCopyWith<$Res> get host {
    if (_value.host == null) {
      return null;
    }
    return $PingHostCopyWith<$Res>(_value.host, (value) {
      return _then(_value.copyWith(host: value));
    });
  }

  @override
  $PingSettingsCopyWith<$Res> get settings {
    if (_value.settings == null) {
      return null;
    }
    return $PingSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }

  @override
  $PingStatsCopyWith<$Res> get stats {
    if (_value.stats == null) {
      return null;
    }
    return $PingStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

abstract class _$PingResultCopyWith<$Res> implements $PingResultCopyWith<$Res> {
  factory _$PingResultCopyWith(
          _PingResult value, $Res Function(_PingResult) then) =
      __$PingResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      PingHost host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<double> values,
      PingStats stats});

  @override
  $PingHostCopyWith<$Res> get host;
  @override
  $PingSettingsCopyWith<$Res> get settings;
  @override
  $PingStatsCopyWith<$Res> get stats;
}

class __$PingResultCopyWithImpl<$Res> extends _$PingResultCopyWithImpl<$Res>
    implements _$PingResultCopyWith<$Res> {
  __$PingResultCopyWithImpl(
      _PingResult _value, $Res Function(_PingResult) _then)
      : super(_value, (v) => _then(v as _PingResult));

  @override
  _PingResult get _value => super._value as _PingResult;

  @override
  $Res call({
    Object id = freezed,
    Object host = freezed,
    Object settings = freezed,
    Object startTime = freezed,
    Object duration = freezed,
    Object values = freezed,
    Object stats = freezed,
  }) {
    return _then(_PingResult(
      id: id == freezed ? _value.id : id as int,
      host: host == freezed ? _value.host : host as PingHost,
      settings:
          settings == freezed ? _value.settings : settings as PingSettings,
      startTime:
          startTime == freezed ? _value.startTime : startTime as DateTime,
      duration: duration == freezed ? _value.duration : duration as Duration,
      values: values == freezed ? _value.values : values as List<double>,
      stats: stats == freezed ? _value.stats : stats as PingStats,
    ));
  }
}

@JsonSerializable()
class _$_PingResult implements _PingResult {
  _$_PingResult(
      {this.id,
      @required this.host,
      @required this.settings,
      @required this.startTime,
      @required this.duration,
      @required this.values,
      @required this.stats})
      : assert(host != null),
        assert(settings != null),
        assert(startTime != null),
        assert(duration != null),
        assert(values != null),
        assert(stats != null);

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
  @override
  final PingStats stats;

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
                const DeepCollectionEquality().equals(other.values, values)) &&
            (identical(other.stats, stats) ||
                const DeepCollectionEquality().equals(other.stats, stats)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(stats);

  @override
  _$PingResultCopyWith<_PingResult> get copyWith =>
      __$PingResultCopyWithImpl<_PingResult>(this, _$identity);

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
      @required List<double> values,
      @required PingStats stats}) = _$_PingResult;

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
  PingStats get stats;
  @override
  _$PingResultCopyWith<_PingResult> get copyWith;
}

PingHost _$PingHostFromJson(Map<String, dynamic> json) {
  return _PingHost.fromJson(json);
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

// ignore: unused_element
const $PingHost = _$PingHostTearOff();

mixin _$PingHost {
  String get name;
  String get ip;

  Map<String, dynamic> toJson();
  $PingHostCopyWith<PingHost> get copyWith;
}

abstract class $PingHostCopyWith<$Res> {
  factory $PingHostCopyWith(PingHost value, $Res Function(PingHost) then) =
      _$PingHostCopyWithImpl<$Res>;
  $Res call({String name, String ip});
}

class _$PingHostCopyWithImpl<$Res> implements $PingHostCopyWith<$Res> {
  _$PingHostCopyWithImpl(this._value, this._then);

  final PingHost _value;
  // ignore: unused_field
  final $Res Function(PingHost) _then;

  @override
  $Res call({
    Object name = freezed,
    Object ip = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      ip: ip == freezed ? _value.ip : ip as String,
    ));
  }
}

abstract class _$PingHostCopyWith<$Res> implements $PingHostCopyWith<$Res> {
  factory _$PingHostCopyWith(_PingHost value, $Res Function(_PingHost) then) =
      __$PingHostCopyWithImpl<$Res>;
  @override
  $Res call({String name, String ip});
}

class __$PingHostCopyWithImpl<$Res> extends _$PingHostCopyWithImpl<$Res>
    implements _$PingHostCopyWith<$Res> {
  __$PingHostCopyWithImpl(_PingHost _value, $Res Function(_PingHost) _then)
      : super(_value, (v) => _then(v as _PingHost));

  @override
  _PingHost get _value => super._value as _PingHost;

  @override
  $Res call({
    Object name = freezed,
    Object ip = freezed,
  }) {
    return _then(_PingHost(
      name: name == freezed ? _value.name : name as String,
      ip: ip == freezed ? _value.ip : ip as String,
    ));
  }
}

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
  _$PingHostCopyWith<_PingHost> get copyWith =>
      __$PingHostCopyWithImpl<_PingHost>(this, _$identity);

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
  _$PingHostCopyWith<_PingHost> get copyWith;
}

PingStats _$PingStatsFromJson(Map<String, dynamic> json) {
  return _PingStats.fromJson(json);
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

// ignore: unused_element
const $PingStats = _$PingStatsTearOff();

mixin _$PingStats {
  double get min;
  double get max;
  double get mean;

  Map<String, dynamic> toJson();
  $PingStatsCopyWith<PingStats> get copyWith;
}

abstract class $PingStatsCopyWith<$Res> {
  factory $PingStatsCopyWith(PingStats value, $Res Function(PingStats) then) =
      _$PingStatsCopyWithImpl<$Res>;
  $Res call({double min, double max, double mean});
}

class _$PingStatsCopyWithImpl<$Res> implements $PingStatsCopyWith<$Res> {
  _$PingStatsCopyWithImpl(this._value, this._then);

  final PingStats _value;
  // ignore: unused_field
  final $Res Function(PingStats) _then;

  @override
  $Res call({
    Object min = freezed,
    Object max = freezed,
    Object mean = freezed,
  }) {
    return _then(_value.copyWith(
      min: min == freezed ? _value.min : min as double,
      max: max == freezed ? _value.max : max as double,
      mean: mean == freezed ? _value.mean : mean as double,
    ));
  }
}

abstract class _$PingStatsCopyWith<$Res> implements $PingStatsCopyWith<$Res> {
  factory _$PingStatsCopyWith(
          _PingStats value, $Res Function(_PingStats) then) =
      __$PingStatsCopyWithImpl<$Res>;
  @override
  $Res call({double min, double max, double mean});
}

class __$PingStatsCopyWithImpl<$Res> extends _$PingStatsCopyWithImpl<$Res>
    implements _$PingStatsCopyWith<$Res> {
  __$PingStatsCopyWithImpl(_PingStats _value, $Res Function(_PingStats) _then)
      : super(_value, (v) => _then(v as _PingStats));

  @override
  _PingStats get _value => super._value as _PingStats;

  @override
  $Res call({
    Object min = freezed,
    Object max = freezed,
    Object mean = freezed,
  }) {
    return _then(_PingStats(
      min: min == freezed ? _value.min : min as double,
      max: max == freezed ? _value.max : max as double,
      mean: mean == freezed ? _value.mean : mean as double,
    ));
  }
}

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
  _$PingStatsCopyWith<_PingStats> get copyWith =>
      __$PingStatsCopyWithImpl<_PingStats>(this, _$identity);

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
  _$PingStatsCopyWith<_PingStats> get copyWith;
}
