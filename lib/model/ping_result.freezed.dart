// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ping_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PingResult _$PingResultFromJson(Map<String, dynamic> json) {
  return _PingResult.fromJson(json);
}

/// @nodoc
class _$PingResultTearOff {
  const _$PingResultTearOff();

  _PingResult call(
      {int? id,
      required String host,
      required PingSettings settings,
      required DateTime startTime,
      required Duration duration,
      required List<int?> values,
      required PingStats stats}) {
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

  PingResult fromJson(Map<String, Object?> json) {
    return PingResult.fromJson(json);
  }
}

/// @nodoc
const $PingResult = _$PingResultTearOff();

/// @nodoc
mixin _$PingResult {
  int? get id => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  PingSettings get settings => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  List<int?> get values => throw _privateConstructorUsedError;
  PingStats get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PingResultCopyWith<PingResult> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingResultCopyWith<$Res> {
  factory $PingResultCopyWith(PingResult value, $Res Function(PingResult) then) =
      _$PingResultCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<int?> values,
      PingStats stats});

  $PingSettingsCopyWith<$Res> get settings;
  $PingStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$PingResultCopyWithImpl<$Res> implements $PingResultCopyWith<$Res> {
  _$PingResultCopyWithImpl(this._value, this._then);

  final PingResult _value;
  // ignore: unused_field
  final $Res Function(PingResult) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? host = freezed,
    Object? settings = freezed,
    Object? startTime = freezed,
    Object? duration = freezed,
    Object? values = freezed,
    Object? stats = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
    ));
  }

  @override
  $PingSettingsCopyWith<$Res> get settings {
    return $PingSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }

  @override
  $PingStatsCopyWith<$Res> get stats {
    return $PingStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

/// @nodoc
abstract class _$PingResultCopyWith<$Res> implements $PingResultCopyWith<$Res> {
  factory _$PingResultCopyWith(_PingResult value, $Res Function(_PingResult) then) =
      __$PingResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String host,
      PingSettings settings,
      DateTime startTime,
      Duration duration,
      List<int?> values,
      PingStats stats});

  @override
  $PingSettingsCopyWith<$Res> get settings;
  @override
  $PingStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$PingResultCopyWithImpl<$Res> extends _$PingResultCopyWithImpl<$Res>
    implements _$PingResultCopyWith<$Res> {
  __$PingResultCopyWithImpl(_PingResult _value, $Res Function(_PingResult) _then)
      : super(_value, (v) => _then(v as _PingResult));

  @override
  _PingResult get _value => super._value as _PingResult;

  @override
  $Res call({
    Object? id = freezed,
    Object? host = freezed,
    Object? settings = freezed,
    Object? startTime = freezed,
    Object? duration = freezed,
    Object? values = freezed,
    Object? stats = freezed,
  }) {
    return _then(_PingResult(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PingResult implements _PingResult {
  _$_PingResult(
      {this.id,
      required this.host,
      required this.settings,
      required this.startTime,
      required this.duration,
      required this.values,
      required this.stats});

  factory _$_PingResult.fromJson(Map<String, dynamic> json) => _$$_PingResultFromJson(json);

  @override
  final int? id;
  @override
  final String host;
  @override
  final PingSettings settings;
  @override
  final DateTime startTime;
  @override
  final Duration duration;
  @override
  final List<int?> values;
  @override
  final PingStats stats;

  @override
  String toString() {
    return 'PingResult(id: $id, host: $host, settings: $settings, startTime: $startTime, duration: $duration, values: $values, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PingResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.settings, settings) || other.settings == settings) &&
            (identical(other.startTime, startTime) || other.startTime == startTime) &&
            (identical(other.duration, duration) || other.duration == duration) &&
            const DeepCollectionEquality().equals(other.values, values) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, host, settings, startTime, duration,
      const DeepCollectionEquality().hash(values), stats);

  @JsonKey(ignore: true)
  @override
  _$PingResultCopyWith<_PingResult> get copyWith =>
      __$PingResultCopyWithImpl<_PingResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PingResultToJson(this);
  }
}

abstract class _PingResult implements PingResult {
  factory _PingResult(
      {int? id,
      required String host,
      required PingSettings settings,
      required DateTime startTime,
      required Duration duration,
      required List<int?> values,
      required PingStats stats}) = _$_PingResult;

  factory _PingResult.fromJson(Map<String, dynamic> json) = _$_PingResult.fromJson;

  @override
  int? get id;
  @override
  String get host;
  @override
  PingSettings get settings;
  @override
  DateTime get startTime;
  @override
  Duration get duration;
  @override
  List<int?> get values;
  @override
  PingStats get stats;
  @override
  @JsonKey(ignore: true)
  _$PingResultCopyWith<_PingResult> get copyWith => throw _privateConstructorUsedError;
}

PingStats _$PingStatsFromJson(Map<String, dynamic> json) {
  return _PingStats.fromJson(json);
}

/// @nodoc
class _$PingStatsTearOff {
  const _$PingStatsTearOff();

  _PingStats call({required int min, required int max, required int mean}) {
    return _PingStats(
      min: min,
      max: max,
      mean: mean,
    );
  }

  PingStats fromJson(Map<String, Object?> json) {
    return PingStats.fromJson(json);
  }
}

/// @nodoc
const $PingStats = _$PingStatsTearOff();

/// @nodoc
mixin _$PingStats {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  int get mean => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PingStatsCopyWith<PingStats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingStatsCopyWith<$Res> {
  factory $PingStatsCopyWith(PingStats value, $Res Function(PingStats) then) =
      _$PingStatsCopyWithImpl<$Res>;
  $Res call({int min, int max, int mean});
}

/// @nodoc
class _$PingStatsCopyWithImpl<$Res> implements $PingStatsCopyWith<$Res> {
  _$PingStatsCopyWithImpl(this._value, this._then);

  final PingStats _value;
  // ignore: unused_field
  final $Res Function(PingStats) _then;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? mean = freezed,
  }) {
    return _then(_value.copyWith(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      mean: mean == freezed
          ? _value.mean
          : mean // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PingStatsCopyWith<$Res> implements $PingStatsCopyWith<$Res> {
  factory _$PingStatsCopyWith(_PingStats value, $Res Function(_PingStats) then) =
      __$PingStatsCopyWithImpl<$Res>;
  @override
  $Res call({int min, int max, int mean});
}

/// @nodoc
class __$PingStatsCopyWithImpl<$Res> extends _$PingStatsCopyWithImpl<$Res>
    implements _$PingStatsCopyWith<$Res> {
  __$PingStatsCopyWithImpl(_PingStats _value, $Res Function(_PingStats) _then)
      : super(_value, (v) => _then(v as _PingStats));

  @override
  _PingStats get _value => super._value as _PingStats;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? mean = freezed,
  }) {
    return _then(_PingStats(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      mean: mean == freezed
          ? _value.mean
          : mean // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PingStats implements _PingStats {
  const _$_PingStats({required this.min, required this.max, required this.mean});

  factory _$_PingStats.fromJson(Map<String, dynamic> json) => _$$_PingStatsFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _PingStats &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.mean, mean) || other.mean == mean));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max, mean);

  @JsonKey(ignore: true)
  @override
  _$PingStatsCopyWith<_PingStats> get copyWith =>
      __$PingStatsCopyWithImpl<_PingStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PingStatsToJson(this);
  }
}

abstract class _PingStats implements PingStats {
  const factory _PingStats({required int min, required int max, required int mean}) = _$_PingStats;

  factory _PingStats.fromJson(Map<String, dynamic> json) = _$_PingStats.fromJson;

  @override
  int get min;
  @override
  int get max;
  @override
  int get mean;
  @override
  @JsonKey(ignore: true)
  _$PingStatsCopyWith<_PingStats> get copyWith => throw _privateConstructorUsedError;
}
