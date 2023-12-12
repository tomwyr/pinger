// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ping_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PingResult _$PingResultFromJson(Map<String, dynamic> json) {
  return _PingResult.fromJson(json);
}

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
  $PingResultCopyWith<PingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingResultCopyWith<$Res> {
  factory $PingResultCopyWith(
          PingResult value, $Res Function(PingResult) then) =
      _$PingResultCopyWithImpl<$Res, PingResult>;
  @useResult
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
class _$PingResultCopyWithImpl<$Res, $Val extends PingResult>
    implements $PingResultCopyWith<$Res> {
  _$PingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? host = null,
    Object? settings = null,
    Object? startTime = null,
    Object? duration = null,
    Object? values = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PingSettingsCopyWith<$Res> get settings {
    return $PingSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PingStatsCopyWith<$Res> get stats {
    return $PingStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PingResultImplCopyWith<$Res>
    implements $PingResultCopyWith<$Res> {
  factory _$$PingResultImplCopyWith(
          _$PingResultImpl value, $Res Function(_$PingResultImpl) then) =
      __$$PingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$PingResultImplCopyWithImpl<$Res>
    extends _$PingResultCopyWithImpl<$Res, _$PingResultImpl>
    implements _$$PingResultImplCopyWith<$Res> {
  __$$PingResultImplCopyWithImpl(
      _$PingResultImpl _value, $Res Function(_$PingResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? host = null,
    Object? settings = null,
    Object? startTime = null,
    Object? duration = null,
    Object? values = null,
    Object? stats = null,
  }) {
    return _then(_$PingResultImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PingResultImpl implements _PingResult {
  _$PingResultImpl(
      {this.id,
      required this.host,
      required this.settings,
      required this.startTime,
      required this.duration,
      required final List<int?> values,
      required this.stats})
      : _values = values;

  factory _$PingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PingResultImplFromJson(json);

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
  final List<int?> _values;
  @override
  List<int?> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

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
            other is _$PingResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, host, settings, startTime,
      duration, const DeepCollectionEquality().hash(_values), stats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PingResultImplCopyWith<_$PingResultImpl> get copyWith =>
      __$$PingResultImplCopyWithImpl<_$PingResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PingResultImplToJson(
      this,
    );
  }
}

abstract class _PingResult implements PingResult {
  factory _PingResult(
      {final int? id,
      required final String host,
      required final PingSettings settings,
      required final DateTime startTime,
      required final Duration duration,
      required final List<int?> values,
      required final PingStats stats}) = _$PingResultImpl;

  factory _PingResult.fromJson(Map<String, dynamic> json) =
      _$PingResultImpl.fromJson;

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
  _$$PingResultImplCopyWith<_$PingResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PingStats _$PingStatsFromJson(Map<String, dynamic> json) {
  return _PingStats.fromJson(json);
}

/// @nodoc
mixin _$PingStats {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  int get mean => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PingStatsCopyWith<PingStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingStatsCopyWith<$Res> {
  factory $PingStatsCopyWith(PingStats value, $Res Function(PingStats) then) =
      _$PingStatsCopyWithImpl<$Res, PingStats>;
  @useResult
  $Res call({int min, int max, int mean});
}

/// @nodoc
class _$PingStatsCopyWithImpl<$Res, $Val extends PingStats>
    implements $PingStatsCopyWith<$Res> {
  _$PingStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? mean = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      mean: null == mean
          ? _value.mean
          : mean // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PingStatsImplCopyWith<$Res>
    implements $PingStatsCopyWith<$Res> {
  factory _$$PingStatsImplCopyWith(
          _$PingStatsImpl value, $Res Function(_$PingStatsImpl) then) =
      __$$PingStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max, int mean});
}

/// @nodoc
class __$$PingStatsImplCopyWithImpl<$Res>
    extends _$PingStatsCopyWithImpl<$Res, _$PingStatsImpl>
    implements _$$PingStatsImplCopyWith<$Res> {
  __$$PingStatsImplCopyWithImpl(
      _$PingStatsImpl _value, $Res Function(_$PingStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? mean = null,
  }) {
    return _then(_$PingStatsImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      mean: null == mean
          ? _value.mean
          : mean // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PingStatsImpl implements _PingStats {
  const _$PingStatsImpl(
      {required this.min, required this.max, required this.mean});

  factory _$PingStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PingStatsImplFromJson(json);

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
            other is _$PingStatsImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.mean, mean) || other.mean == mean));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, min, max, mean);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PingStatsImplCopyWith<_$PingStatsImpl> get copyWith =>
      __$$PingStatsImplCopyWithImpl<_$PingStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PingStatsImplToJson(
      this,
    );
  }
}

abstract class _PingStats implements PingStats {
  const factory _PingStats(
      {required final int min,
      required final int max,
      required final int mean}) = _$PingStatsImpl;

  factory _PingStats.fromJson(Map<String, dynamic> json) =
      _$PingStatsImpl.fromJson;

  @override
  int get min;
  @override
  int get max;
  @override
  int get mean;
  @override
  @JsonKey(ignore: true)
  _$$PingStatsImplCopyWith<_$PingStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
