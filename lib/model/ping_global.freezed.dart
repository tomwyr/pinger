// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ping_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GlobalPingCounts _$GlobalPingCountsFromJson(Map<String, dynamic> json) {
  return _GlobalPingCounts.fromJson(json);
}

/// @nodoc
mixin _$GlobalPingCounts {
  int get totalCount => throw _privateConstructorUsedError;
  List<PingCount> get pingCounts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalPingCountsCopyWith<GlobalPingCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalPingCountsCopyWith<$Res> {
  factory $GlobalPingCountsCopyWith(
          GlobalPingCounts value, $Res Function(GlobalPingCounts) then) =
      _$GlobalPingCountsCopyWithImpl<$Res, GlobalPingCounts>;
  @useResult
  $Res call({int totalCount, List<PingCount> pingCounts});
}

/// @nodoc
class _$GlobalPingCountsCopyWithImpl<$Res, $Val extends GlobalPingCounts>
    implements $GlobalPingCountsCopyWith<$Res> {
  _$GlobalPingCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? pingCounts = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pingCounts: null == pingCounts
          ? _value.pingCounts
          : pingCounts // ignore: cast_nullable_to_non_nullable
              as List<PingCount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalPingCountsImplCopyWith<$Res>
    implements $GlobalPingCountsCopyWith<$Res> {
  factory _$$GlobalPingCountsImplCopyWith(_$GlobalPingCountsImpl value,
          $Res Function(_$GlobalPingCountsImpl) then) =
      __$$GlobalPingCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, List<PingCount> pingCounts});
}

/// @nodoc
class __$$GlobalPingCountsImplCopyWithImpl<$Res>
    extends _$GlobalPingCountsCopyWithImpl<$Res, _$GlobalPingCountsImpl>
    implements _$$GlobalPingCountsImplCopyWith<$Res> {
  __$$GlobalPingCountsImplCopyWithImpl(_$GlobalPingCountsImpl _value,
      $Res Function(_$GlobalPingCountsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? pingCounts = null,
  }) {
    return _then(_$GlobalPingCountsImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pingCounts: null == pingCounts
          ? _value._pingCounts
          : pingCounts // ignore: cast_nullable_to_non_nullable
              as List<PingCount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalPingCountsImpl implements _GlobalPingCounts {
  _$GlobalPingCountsImpl(
      {required this.totalCount, required final List<PingCount> pingCounts})
      : _pingCounts = pingCounts;

  factory _$GlobalPingCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalPingCountsImplFromJson(json);

  @override
  final int totalCount;
  final List<PingCount> _pingCounts;
  @override
  List<PingCount> get pingCounts {
    if (_pingCounts is EqualUnmodifiableListView) return _pingCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pingCounts);
  }

  @override
  String toString() {
    return 'GlobalPingCounts(totalCount: $totalCount, pingCounts: $pingCounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalPingCountsImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality()
                .equals(other._pingCounts, _pingCounts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount,
      const DeepCollectionEquality().hash(_pingCounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalPingCountsImplCopyWith<_$GlobalPingCountsImpl> get copyWith =>
      __$$GlobalPingCountsImplCopyWithImpl<_$GlobalPingCountsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalPingCountsImplToJson(
      this,
    );
  }
}

abstract class _GlobalPingCounts implements GlobalPingCounts {
  factory _GlobalPingCounts(
      {required final int totalCount,
      required final List<PingCount> pingCounts}) = _$GlobalPingCountsImpl;

  factory _GlobalPingCounts.fromJson(Map<String, dynamic> json) =
      _$GlobalPingCountsImpl.fromJson;

  @override
  int get totalCount;
  @override
  List<PingCount> get pingCounts;
  @override
  @JsonKey(ignore: true)
  _$$GlobalPingCountsImplCopyWith<_$GlobalPingCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PingCount _$PingCountFromJson(Map<String, dynamic> json) {
  return _PingCount.fromJson(json);
}

/// @nodoc
mixin _$PingCount {
  String get host => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PingCountCopyWith<PingCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingCountCopyWith<$Res> {
  factory $PingCountCopyWith(PingCount value, $Res Function(PingCount) then) =
      _$PingCountCopyWithImpl<$Res, PingCount>;
  @useResult
  $Res call({String host, int count});
}

/// @nodoc
class _$PingCountCopyWithImpl<$Res, $Val extends PingCount>
    implements $PingCountCopyWith<$Res> {
  _$PingCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PingCountImplCopyWith<$Res>
    implements $PingCountCopyWith<$Res> {
  factory _$$PingCountImplCopyWith(
          _$PingCountImpl value, $Res Function(_$PingCountImpl) then) =
      __$$PingCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host, int count});
}

/// @nodoc
class __$$PingCountImplCopyWithImpl<$Res>
    extends _$PingCountCopyWithImpl<$Res, _$PingCountImpl>
    implements _$$PingCountImplCopyWith<$Res> {
  __$$PingCountImplCopyWithImpl(
      _$PingCountImpl _value, $Res Function(_$PingCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? count = null,
  }) {
    return _then(_$PingCountImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PingCountImpl implements _PingCount {
  _$PingCountImpl({required this.host, required this.count});

  factory _$PingCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$PingCountImplFromJson(json);

  @override
  final String host;
  @override
  final int count;

  @override
  String toString() {
    return 'PingCount(host: $host, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PingCountImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, host, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PingCountImplCopyWith<_$PingCountImpl> get copyWith =>
      __$$PingCountImplCopyWithImpl<_$PingCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PingCountImplToJson(
      this,
    );
  }
}

abstract class _PingCount implements PingCount {
  factory _PingCount({required final String host, required final int count}) =
      _$PingCountImpl;

  factory _PingCount.fromJson(Map<String, dynamic> json) =
      _$PingCountImpl.fromJson;

  @override
  String get host;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$PingCountImplCopyWith<_$PingCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalHostResults _$GlobalHostResultsFromJson(Map<String, dynamic> json) {
  return _GlobalHostResults.fromJson(json);
}

/// @nodoc
mixin _$GlobalHostResults {
  int get totalCount => throw _privateConstructorUsedError;
  ValueResults get valueResults => throw _privateConstructorUsedError;
  List<LocationResults> get locationResults =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalHostResultsCopyWith<GlobalHostResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalHostResultsCopyWith<$Res> {
  factory $GlobalHostResultsCopyWith(
          GlobalHostResults value, $Res Function(GlobalHostResults) then) =
      _$GlobalHostResultsCopyWithImpl<$Res, GlobalHostResults>;
  @useResult
  $Res call(
      {int totalCount,
      ValueResults valueResults,
      List<LocationResults> locationResults});

  $ValueResultsCopyWith<$Res> get valueResults;
}

/// @nodoc
class _$GlobalHostResultsCopyWithImpl<$Res, $Val extends GlobalHostResults>
    implements $GlobalHostResultsCopyWith<$Res> {
  _$GlobalHostResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? valueResults = null,
    Object? locationResults = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      valueResults: null == valueResults
          ? _value.valueResults
          : valueResults // ignore: cast_nullable_to_non_nullable
              as ValueResults,
      locationResults: null == locationResults
          ? _value.locationResults
          : locationResults // ignore: cast_nullable_to_non_nullable
              as List<LocationResults>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ValueResultsCopyWith<$Res> get valueResults {
    return $ValueResultsCopyWith<$Res>(_value.valueResults, (value) {
      return _then(_value.copyWith(valueResults: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GlobalHostResultsImplCopyWith<$Res>
    implements $GlobalHostResultsCopyWith<$Res> {
  factory _$$GlobalHostResultsImplCopyWith(_$GlobalHostResultsImpl value,
          $Res Function(_$GlobalHostResultsImpl) then) =
      __$$GlobalHostResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCount,
      ValueResults valueResults,
      List<LocationResults> locationResults});

  @override
  $ValueResultsCopyWith<$Res> get valueResults;
}

/// @nodoc
class __$$GlobalHostResultsImplCopyWithImpl<$Res>
    extends _$GlobalHostResultsCopyWithImpl<$Res, _$GlobalHostResultsImpl>
    implements _$$GlobalHostResultsImplCopyWith<$Res> {
  __$$GlobalHostResultsImplCopyWithImpl(_$GlobalHostResultsImpl _value,
      $Res Function(_$GlobalHostResultsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? valueResults = null,
    Object? locationResults = null,
  }) {
    return _then(_$GlobalHostResultsImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      valueResults: null == valueResults
          ? _value.valueResults
          : valueResults // ignore: cast_nullable_to_non_nullable
              as ValueResults,
      locationResults: null == locationResults
          ? _value._locationResults
          : locationResults // ignore: cast_nullable_to_non_nullable
              as List<LocationResults>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalHostResultsImpl implements _GlobalHostResults {
  _$GlobalHostResultsImpl(
      {required this.totalCount,
      required this.valueResults,
      required final List<LocationResults> locationResults})
      : _locationResults = locationResults;

  factory _$GlobalHostResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalHostResultsImplFromJson(json);

  @override
  final int totalCount;
  @override
  final ValueResults valueResults;
  final List<LocationResults> _locationResults;
  @override
  List<LocationResults> get locationResults {
    if (_locationResults is EqualUnmodifiableListView) return _locationResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationResults);
  }

  @override
  String toString() {
    return 'GlobalHostResults(totalCount: $totalCount, valueResults: $valueResults, locationResults: $locationResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalHostResultsImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.valueResults, valueResults) ||
                other.valueResults == valueResults) &&
            const DeepCollectionEquality()
                .equals(other._locationResults, _locationResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, valueResults,
      const DeepCollectionEquality().hash(_locationResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalHostResultsImplCopyWith<_$GlobalHostResultsImpl> get copyWith =>
      __$$GlobalHostResultsImplCopyWithImpl<_$GlobalHostResultsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalHostResultsImplToJson(
      this,
    );
  }
}

abstract class _GlobalHostResults implements GlobalHostResults {
  factory _GlobalHostResults(
          {required final int totalCount,
          required final ValueResults valueResults,
          required final List<LocationResults> locationResults}) =
      _$GlobalHostResultsImpl;

  factory _GlobalHostResults.fromJson(Map<String, dynamic> json) =
      _$GlobalHostResultsImpl.fromJson;

  @override
  int get totalCount;
  @override
  ValueResults get valueResults;
  @override
  List<LocationResults> get locationResults;
  @override
  @JsonKey(ignore: true)
  _$$GlobalHostResultsImplCopyWith<_$GlobalHostResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValueResults _$ValueResultsFromJson(Map<String, dynamic> json) {
  return _ValueResults.fromJson(json);
}

/// @nodoc
mixin _$ValueResults {
  Map<int, int> get min => throw _privateConstructorUsedError;
  Map<int, int> get mean => throw _privateConstructorUsedError;
  Map<int, int> get max => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValueResultsCopyWith<ValueResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueResultsCopyWith<$Res> {
  factory $ValueResultsCopyWith(
          ValueResults value, $Res Function(ValueResults) then) =
      _$ValueResultsCopyWithImpl<$Res, ValueResults>;
  @useResult
  $Res call({Map<int, int> min, Map<int, int> mean, Map<int, int> max});
}

/// @nodoc
class _$ValueResultsCopyWithImpl<$Res, $Val extends ValueResults>
    implements $ValueResultsCopyWith<$Res> {
  _$ValueResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? mean = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      mean: null == mean
          ? _value.mean
          : mean // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValueResultsImplCopyWith<$Res>
    implements $ValueResultsCopyWith<$Res> {
  factory _$$ValueResultsImplCopyWith(
          _$ValueResultsImpl value, $Res Function(_$ValueResultsImpl) then) =
      __$$ValueResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, int> min, Map<int, int> mean, Map<int, int> max});
}

/// @nodoc
class __$$ValueResultsImplCopyWithImpl<$Res>
    extends _$ValueResultsCopyWithImpl<$Res, _$ValueResultsImpl>
    implements _$$ValueResultsImplCopyWith<$Res> {
  __$$ValueResultsImplCopyWithImpl(
      _$ValueResultsImpl _value, $Res Function(_$ValueResultsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? mean = null,
    Object? max = null,
  }) {
    return _then(_$ValueResultsImpl(
      min: null == min
          ? _value._min
          : min // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      mean: null == mean
          ? _value._mean
          : mean // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      max: null == max
          ? _value._max
          : max // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValueResultsImpl implements _ValueResults {
  _$ValueResultsImpl(
      {required final Map<int, int> min,
      required final Map<int, int> mean,
      required final Map<int, int> max})
      : _min = min,
        _mean = mean,
        _max = max;

  factory _$ValueResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValueResultsImplFromJson(json);

  final Map<int, int> _min;
  @override
  Map<int, int> get min {
    if (_min is EqualUnmodifiableMapView) return _min;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_min);
  }

  final Map<int, int> _mean;
  @override
  Map<int, int> get mean {
    if (_mean is EqualUnmodifiableMapView) return _mean;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mean);
  }

  final Map<int, int> _max;
  @override
  Map<int, int> get max {
    if (_max is EqualUnmodifiableMapView) return _max;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_max);
  }

  @override
  String toString() {
    return 'ValueResults(min: $min, mean: $mean, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueResultsImpl &&
            const DeepCollectionEquality().equals(other._min, _min) &&
            const DeepCollectionEquality().equals(other._mean, _mean) &&
            const DeepCollectionEquality().equals(other._max, _max));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_min),
      const DeepCollectionEquality().hash(_mean),
      const DeepCollectionEquality().hash(_max));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueResultsImplCopyWith<_$ValueResultsImpl> get copyWith =>
      __$$ValueResultsImplCopyWithImpl<_$ValueResultsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValueResultsImplToJson(
      this,
    );
  }
}

abstract class _ValueResults implements ValueResults {
  factory _ValueResults(
      {required final Map<int, int> min,
      required final Map<int, int> mean,
      required final Map<int, int> max}) = _$ValueResultsImpl;

  factory _ValueResults.fromJson(Map<String, dynamic> json) =
      _$ValueResultsImpl.fromJson;

  @override
  Map<int, int> get min;
  @override
  Map<int, int> get mean;
  @override
  Map<int, int> get max;
  @override
  @JsonKey(ignore: true)
  _$$ValueResultsImplCopyWith<_$ValueResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationResults _$LocationResultsFromJson(Map<String, dynamic> json) {
  return _LocationResults.fromJson(json);
}

/// @nodoc
mixin _$LocationResults {
  int get count => throw _privateConstructorUsedError;
  GeoPosition get location => throw _privateConstructorUsedError;
  PingStats get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationResultsCopyWith<LocationResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationResultsCopyWith<$Res> {
  factory $LocationResultsCopyWith(
          LocationResults value, $Res Function(LocationResults) then) =
      _$LocationResultsCopyWithImpl<$Res, LocationResults>;
  @useResult
  $Res call({int count, GeoPosition location, PingStats stats});

  $GeoPositionCopyWith<$Res> get location;
  $PingStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$LocationResultsCopyWithImpl<$Res, $Val extends LocationResults>
    implements $LocationResultsCopyWith<$Res> {
  _$LocationResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? location = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPosition,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoPositionCopyWith<$Res> get location {
    return $GeoPositionCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
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
abstract class _$$LocationResultsImplCopyWith<$Res>
    implements $LocationResultsCopyWith<$Res> {
  factory _$$LocationResultsImplCopyWith(_$LocationResultsImpl value,
          $Res Function(_$LocationResultsImpl) then) =
      __$$LocationResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, GeoPosition location, PingStats stats});

  @override
  $GeoPositionCopyWith<$Res> get location;
  @override
  $PingStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$LocationResultsImplCopyWithImpl<$Res>
    extends _$LocationResultsCopyWithImpl<$Res, _$LocationResultsImpl>
    implements _$$LocationResultsImplCopyWith<$Res> {
  __$$LocationResultsImplCopyWithImpl(
      _$LocationResultsImpl _value, $Res Function(_$LocationResultsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? location = null,
    Object? stats = null,
  }) {
    return _then(_$LocationResultsImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPosition,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationResultsImpl implements _LocationResults {
  _$LocationResultsImpl(
      {required this.count, required this.location, required this.stats});

  factory _$LocationResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationResultsImplFromJson(json);

  @override
  final int count;
  @override
  final GeoPosition location;
  @override
  final PingStats stats;

  @override
  String toString() {
    return 'LocationResults(count: $count, location: $location, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationResultsImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, location, stats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationResultsImplCopyWith<_$LocationResultsImpl> get copyWith =>
      __$$LocationResultsImplCopyWithImpl<_$LocationResultsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationResultsImplToJson(
      this,
    );
  }
}

abstract class _LocationResults implements LocationResults {
  factory _LocationResults(
      {required final int count,
      required final GeoPosition location,
      required final PingStats stats}) = _$LocationResultsImpl;

  factory _LocationResults.fromJson(Map<String, dynamic> json) =
      _$LocationResultsImpl.fromJson;

  @override
  int get count;
  @override
  GeoPosition get location;
  @override
  PingStats get stats;
  @override
  @JsonKey(ignore: true)
  _$$LocationResultsImplCopyWith<_$LocationResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalSessionResult _$GlobalSessionResultFromJson(Map<String, dynamic> json) {
  return _GlobalSessionResult.fromJson(json);
}

/// @nodoc
mixin _$GlobalSessionResult {
  int get count => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  PingStats get stats => throw _privateConstructorUsedError;
  GeoPosition? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalSessionResultCopyWith<GlobalSessionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSessionResultCopyWith<$Res> {
  factory $GlobalSessionResultCopyWith(
          GlobalSessionResult value, $Res Function(GlobalSessionResult) then) =
      _$GlobalSessionResultCopyWithImpl<$Res, GlobalSessionResult>;
  @useResult
  $Res call({int count, String host, PingStats stats, GeoPosition? location});

  $PingStatsCopyWith<$Res> get stats;
  $GeoPositionCopyWith<$Res>? get location;
}

/// @nodoc
class _$GlobalSessionResultCopyWithImpl<$Res, $Val extends GlobalSessionResult>
    implements $GlobalSessionResultCopyWith<$Res> {
  _$GlobalSessionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? host = null,
    Object? stats = null,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPosition?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PingStatsCopyWith<$Res> get stats {
    return $PingStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoPositionCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $GeoPositionCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GlobalSessionResultImplCopyWith<$Res>
    implements $GlobalSessionResultCopyWith<$Res> {
  factory _$$GlobalSessionResultImplCopyWith(_$GlobalSessionResultImpl value,
          $Res Function(_$GlobalSessionResultImpl) then) =
      __$$GlobalSessionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, String host, PingStats stats, GeoPosition? location});

  @override
  $PingStatsCopyWith<$Res> get stats;
  @override
  $GeoPositionCopyWith<$Res>? get location;
}

/// @nodoc
class __$$GlobalSessionResultImplCopyWithImpl<$Res>
    extends _$GlobalSessionResultCopyWithImpl<$Res, _$GlobalSessionResultImpl>
    implements _$$GlobalSessionResultImplCopyWith<$Res> {
  __$$GlobalSessionResultImplCopyWithImpl(_$GlobalSessionResultImpl _value,
      $Res Function(_$GlobalSessionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? host = null,
    Object? stats = null,
    Object? location = freezed,
  }) {
    return _then(_$GlobalSessionResultImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PingStats,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPosition?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalSessionResultImpl implements _GlobalSessionResult {
  _$GlobalSessionResultImpl(
      {required this.count,
      required this.host,
      required this.stats,
      this.location});

  factory _$GlobalSessionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalSessionResultImplFromJson(json);

  @override
  final int count;
  @override
  final String host;
  @override
  final PingStats stats;
  @override
  final GeoPosition? location;

  @override
  String toString() {
    return 'GlobalSessionResult(count: $count, host: $host, stats: $stats, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSessionResultImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, host, stats, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSessionResultImplCopyWith<_$GlobalSessionResultImpl> get copyWith =>
      __$$GlobalSessionResultImplCopyWithImpl<_$GlobalSessionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalSessionResultImplToJson(
      this,
    );
  }
}

abstract class _GlobalSessionResult implements GlobalSessionResult {
  factory _GlobalSessionResult(
      {required final int count,
      required final String host,
      required final PingStats stats,
      final GeoPosition? location}) = _$GlobalSessionResultImpl;

  factory _GlobalSessionResult.fromJson(Map<String, dynamic> json) =
      _$GlobalSessionResultImpl.fromJson;

  @override
  int get count;
  @override
  String get host;
  @override
  PingStats get stats;
  @override
  GeoPosition? get location;
  @override
  @JsonKey(ignore: true)
  _$$GlobalSessionResultImplCopyWith<_$GlobalSessionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
