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
      @required String host,
      @required PingSettings settings,
      @required DateTime startTime,
      @required Duration duration,
      @required List<int> values,
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
  String get host;
  PingSettings get settings;
  DateTime get startTime;
  Duration get duration;
  List<int> get values;
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
      String host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<int> values,
      PingStats stats});

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
      host: host == freezed ? _value.host : host as String,
      settings:
          settings == freezed ? _value.settings : settings as PingSettings,
      startTime:
          startTime == freezed ? _value.startTime : startTime as DateTime,
      duration: duration == freezed ? _value.duration : duration as Duration,
      values: values == freezed ? _value.values : values as List<int>,
      stats: stats == freezed ? _value.stats : stats as PingStats,
    ));
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
      String host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<int> values,
      PingStats stats});

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
      host: host == freezed ? _value.host : host as String,
      settings:
          settings == freezed ? _value.settings : settings as PingSettings,
      startTime:
          startTime == freezed ? _value.startTime : startTime as DateTime,
      duration: duration == freezed ? _value.duration : duration as Duration,
      values: values == freezed ? _value.values : values as List<int>,
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
  final String host;
  @override
  final PingSettings settings;
  @override
  final DateTime startTime;
  @override
  final Duration duration;
  @override
  final List<int> values;
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
      @required String host,
      @required PingSettings settings,
      @required DateTime startTime,
      @required Duration duration,
      @required List<int> values,
      @required PingStats stats}) = _$_PingResult;

  factory _PingResult.fromJson(Map<String, dynamic> json) =
      _$_PingResult.fromJson;

  @override
  int get id;
  @override
  String get host;
  @override
  PingSettings get settings;
  @override
  DateTime get startTime;
  @override
  Duration get duration;
  @override
  List<int> get values;
  @override
  PingStats get stats;
  @override
  _$PingResultCopyWith<_PingResult> get copyWith;
}

PingStats _$PingStatsFromJson(Map<String, dynamic> json) {
  return _PingStats.fromJson(json);
}

class _$PingStatsTearOff {
  const _$PingStatsTearOff();

  _PingStats call({@required int min, @required int max, @required int mean}) {
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
  int get min;
  int get max;
  int get mean;

  Map<String, dynamic> toJson();
  $PingStatsCopyWith<PingStats> get copyWith;
}

abstract class $PingStatsCopyWith<$Res> {
  factory $PingStatsCopyWith(PingStats value, $Res Function(PingStats) then) =
      _$PingStatsCopyWithImpl<$Res>;
  $Res call({int min, int max, int mean});
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
      min: min == freezed ? _value.min : min as int,
      max: max == freezed ? _value.max : max as int,
      mean: mean == freezed ? _value.mean : mean as int,
    ));
  }
}

abstract class _$PingStatsCopyWith<$Res> implements $PingStatsCopyWith<$Res> {
  factory _$PingStatsCopyWith(
          _PingStats value, $Res Function(_PingStats) then) =
      __$PingStatsCopyWithImpl<$Res>;
  @override
  $Res call({int min, int max, int mean});
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
      min: min == freezed ? _value.min : min as int,
      max: max == freezed ? _value.max : max as int,
      mean: mean == freezed ? _value.mean : mean as int,
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
  final int min;
  @override
  final int max;
  @override
  final int mean;

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
      {@required int min,
      @required int max,
      @required int mean}) = _$_PingStats;

  factory _PingStats.fromJson(Map<String, dynamic> json) =
      _$_PingStats.fromJson;

  @override
  int get min;
  @override
  int get max;
  @override
  int get mean;
  @override
  _$PingStatsCopyWith<_PingStats> get copyWith;
}
