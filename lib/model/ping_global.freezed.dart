// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ping_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PingGlobalResults _$PingGlobalResultsFromJson(Map<String, dynamic> json) {
  return _PingGlobalResults.fromJson(json);
}

class _$PingGlobalResultsTearOff {
  const _$PingGlobalResultsTearOff();

  _PingGlobalResults call(
      {@required List<PingGeoStats> geoStats,
      @required PingGroupStats groupStats}) {
    return _PingGlobalResults(
      geoStats: geoStats,
      groupStats: groupStats,
    );
  }
}

// ignore: unused_element
const $PingGlobalResults = _$PingGlobalResultsTearOff();

mixin _$PingGlobalResults {
  List<PingGeoStats> get geoStats;
  PingGroupStats get groupStats;

  Map<String, dynamic> toJson();
  $PingGlobalResultsCopyWith<PingGlobalResults> get copyWith;
}

abstract class $PingGlobalResultsCopyWith<$Res> {
  factory $PingGlobalResultsCopyWith(
          PingGlobalResults value, $Res Function(PingGlobalResults) then) =
      _$PingGlobalResultsCopyWithImpl<$Res>;
  $Res call({List<PingGeoStats> geoStats, PingGroupStats groupStats});

  $PingGroupStatsCopyWith<$Res> get groupStats;
}

class _$PingGlobalResultsCopyWithImpl<$Res>
    implements $PingGlobalResultsCopyWith<$Res> {
  _$PingGlobalResultsCopyWithImpl(this._value, this._then);

  final PingGlobalResults _value;
  // ignore: unused_field
  final $Res Function(PingGlobalResults) _then;

  @override
  $Res call({
    Object geoStats = freezed,
    Object groupStats = freezed,
  }) {
    return _then(_value.copyWith(
      geoStats: geoStats == freezed
          ? _value.geoStats
          : geoStats as List<PingGeoStats>,
      groupStats: groupStats == freezed
          ? _value.groupStats
          : groupStats as PingGroupStats,
    ));
  }

  @override
  $PingGroupStatsCopyWith<$Res> get groupStats {
    if (_value.groupStats == null) {
      return null;
    }
    return $PingGroupStatsCopyWith<$Res>(_value.groupStats, (value) {
      return _then(_value.copyWith(groupStats: value));
    });
  }
}

abstract class _$PingGlobalResultsCopyWith<$Res>
    implements $PingGlobalResultsCopyWith<$Res> {
  factory _$PingGlobalResultsCopyWith(
          _PingGlobalResults value, $Res Function(_PingGlobalResults) then) =
      __$PingGlobalResultsCopyWithImpl<$Res>;
  @override
  $Res call({List<PingGeoStats> geoStats, PingGroupStats groupStats});

  @override
  $PingGroupStatsCopyWith<$Res> get groupStats;
}

class __$PingGlobalResultsCopyWithImpl<$Res>
    extends _$PingGlobalResultsCopyWithImpl<$Res>
    implements _$PingGlobalResultsCopyWith<$Res> {
  __$PingGlobalResultsCopyWithImpl(
      _PingGlobalResults _value, $Res Function(_PingGlobalResults) _then)
      : super(_value, (v) => _then(v as _PingGlobalResults));

  @override
  _PingGlobalResults get _value => super._value as _PingGlobalResults;

  @override
  $Res call({
    Object geoStats = freezed,
    Object groupStats = freezed,
  }) {
    return _then(_PingGlobalResults(
      geoStats: geoStats == freezed
          ? _value.geoStats
          : geoStats as List<PingGeoStats>,
      groupStats: groupStats == freezed
          ? _value.groupStats
          : groupStats as PingGroupStats,
    ));
  }
}

@JsonSerializable()
class _$_PingGlobalResults implements _PingGlobalResults {
  _$_PingGlobalResults({@required this.geoStats, @required this.groupStats})
      : assert(geoStats != null),
        assert(groupStats != null);

  factory _$_PingGlobalResults.fromJson(Map<String, dynamic> json) =>
      _$_$_PingGlobalResultsFromJson(json);

  @override
  final List<PingGeoStats> geoStats;
  @override
  final PingGroupStats groupStats;

  @override
  String toString() {
    return 'PingGlobalResults(geoStats: $geoStats, groupStats: $groupStats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingGlobalResults &&
            (identical(other.geoStats, geoStats) ||
                const DeepCollectionEquality()
                    .equals(other.geoStats, geoStats)) &&
            (identical(other.groupStats, groupStats) ||
                const DeepCollectionEquality()
                    .equals(other.groupStats, groupStats)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(geoStats) ^
      const DeepCollectionEquality().hash(groupStats);

  @override
  _$PingGlobalResultsCopyWith<_PingGlobalResults> get copyWith =>
      __$PingGlobalResultsCopyWithImpl<_PingGlobalResults>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingGlobalResultsToJson(this);
  }
}

abstract class _PingGlobalResults implements PingGlobalResults {
  factory _PingGlobalResults(
      {@required List<PingGeoStats> geoStats,
      @required PingGroupStats groupStats}) = _$_PingGlobalResults;

  factory _PingGlobalResults.fromJson(Map<String, dynamic> json) =
      _$_PingGlobalResults.fromJson;

  @override
  List<PingGeoStats> get geoStats;
  @override
  PingGroupStats get groupStats;
  @override
  _$PingGlobalResultsCopyWith<_PingGlobalResults> get copyWith;
}

PingGeoStats _$PingGeoStatsFromJson(Map<String, dynamic> json) {
  return _PingGeoStats.fromJson(json);
}

class _$PingGeoStatsTearOff {
  const _$PingGeoStatsTearOff();

  _PingGeoStats call(
      {@required GeoPosition position, @required PingStats stats}) {
    return _PingGeoStats(
      position: position,
      stats: stats,
    );
  }
}

// ignore: unused_element
const $PingGeoStats = _$PingGeoStatsTearOff();

mixin _$PingGeoStats {
  GeoPosition get position;
  PingStats get stats;

  Map<String, dynamic> toJson();
  $PingGeoStatsCopyWith<PingGeoStats> get copyWith;
}

abstract class $PingGeoStatsCopyWith<$Res> {
  factory $PingGeoStatsCopyWith(
          PingGeoStats value, $Res Function(PingGeoStats) then) =
      _$PingGeoStatsCopyWithImpl<$Res>;
  $Res call({GeoPosition position, PingStats stats});

  $GeoPositionCopyWith<$Res> get position;
  $PingStatsCopyWith<$Res> get stats;
}

class _$PingGeoStatsCopyWithImpl<$Res> implements $PingGeoStatsCopyWith<$Res> {
  _$PingGeoStatsCopyWithImpl(this._value, this._then);

  final PingGeoStats _value;
  // ignore: unused_field
  final $Res Function(PingGeoStats) _then;

  @override
  $Res call({
    Object position = freezed,
    Object stats = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed ? _value.position : position as GeoPosition,
      stats: stats == freezed ? _value.stats : stats as PingStats,
    ));
  }

  @override
  $GeoPositionCopyWith<$Res> get position {
    if (_value.position == null) {
      return null;
    }
    return $GeoPositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value));
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

abstract class _$PingGeoStatsCopyWith<$Res>
    implements $PingGeoStatsCopyWith<$Res> {
  factory _$PingGeoStatsCopyWith(
          _PingGeoStats value, $Res Function(_PingGeoStats) then) =
      __$PingGeoStatsCopyWithImpl<$Res>;
  @override
  $Res call({GeoPosition position, PingStats stats});

  @override
  $GeoPositionCopyWith<$Res> get position;
  @override
  $PingStatsCopyWith<$Res> get stats;
}

class __$PingGeoStatsCopyWithImpl<$Res> extends _$PingGeoStatsCopyWithImpl<$Res>
    implements _$PingGeoStatsCopyWith<$Res> {
  __$PingGeoStatsCopyWithImpl(
      _PingGeoStats _value, $Res Function(_PingGeoStats) _then)
      : super(_value, (v) => _then(v as _PingGeoStats));

  @override
  _PingGeoStats get _value => super._value as _PingGeoStats;

  @override
  $Res call({
    Object position = freezed,
    Object stats = freezed,
  }) {
    return _then(_PingGeoStats(
      position: position == freezed ? _value.position : position as GeoPosition,
      stats: stats == freezed ? _value.stats : stats as PingStats,
    ));
  }
}

@JsonSerializable()
class _$_PingGeoStats implements _PingGeoStats {
  _$_PingGeoStats({@required this.position, @required this.stats})
      : assert(position != null),
        assert(stats != null);

  factory _$_PingGeoStats.fromJson(Map<String, dynamic> json) =>
      _$_$_PingGeoStatsFromJson(json);

  @override
  final GeoPosition position;
  @override
  final PingStats stats;

  @override
  String toString() {
    return 'PingGeoStats(position: $position, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingGeoStats &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.stats, stats) ||
                const DeepCollectionEquality().equals(other.stats, stats)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(stats);

  @override
  _$PingGeoStatsCopyWith<_PingGeoStats> get copyWith =>
      __$PingGeoStatsCopyWithImpl<_PingGeoStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingGeoStatsToJson(this);
  }
}

abstract class _PingGeoStats implements PingGeoStats {
  factory _PingGeoStats(
      {@required GeoPosition position,
      @required PingStats stats}) = _$_PingGeoStats;

  factory _PingGeoStats.fromJson(Map<String, dynamic> json) =
      _$_PingGeoStats.fromJson;

  @override
  GeoPosition get position;
  @override
  PingStats get stats;
  @override
  _$PingGeoStatsCopyWith<_PingGeoStats> get copyWith;
}

PingGroupStats _$PingGroupStatsFromJson(Map<String, dynamic> json) {
  return _PingGlobalStats.fromJson(json);
}

class _$PingGroupStatsTearOff {
  const _$PingGroupStatsTearOff();

  _PingGlobalStats call(
      {@required List<PingGroup> min,
      @required List<PingGroup> mean,
      @required List<PingGroup> max}) {
    return _PingGlobalStats(
      min: min,
      mean: mean,
      max: max,
    );
  }
}

// ignore: unused_element
const $PingGroupStats = _$PingGroupStatsTearOff();

mixin _$PingGroupStats {
  List<PingGroup> get min;
  List<PingGroup> get mean;
  List<PingGroup> get max;

  Map<String, dynamic> toJson();
  $PingGroupStatsCopyWith<PingGroupStats> get copyWith;
}

abstract class $PingGroupStatsCopyWith<$Res> {
  factory $PingGroupStatsCopyWith(
          PingGroupStats value, $Res Function(PingGroupStats) then) =
      _$PingGroupStatsCopyWithImpl<$Res>;
  $Res call({List<PingGroup> min, List<PingGroup> mean, List<PingGroup> max});
}

class _$PingGroupStatsCopyWithImpl<$Res>
    implements $PingGroupStatsCopyWith<$Res> {
  _$PingGroupStatsCopyWithImpl(this._value, this._then);

  final PingGroupStats _value;
  // ignore: unused_field
  final $Res Function(PingGroupStats) _then;

  @override
  $Res call({
    Object min = freezed,
    Object mean = freezed,
    Object max = freezed,
  }) {
    return _then(_value.copyWith(
      min: min == freezed ? _value.min : min as List<PingGroup>,
      mean: mean == freezed ? _value.mean : mean as List<PingGroup>,
      max: max == freezed ? _value.max : max as List<PingGroup>,
    ));
  }
}

abstract class _$PingGlobalStatsCopyWith<$Res>
    implements $PingGroupStatsCopyWith<$Res> {
  factory _$PingGlobalStatsCopyWith(
          _PingGlobalStats value, $Res Function(_PingGlobalStats) then) =
      __$PingGlobalStatsCopyWithImpl<$Res>;
  @override
  $Res call({List<PingGroup> min, List<PingGroup> mean, List<PingGroup> max});
}

class __$PingGlobalStatsCopyWithImpl<$Res>
    extends _$PingGroupStatsCopyWithImpl<$Res>
    implements _$PingGlobalStatsCopyWith<$Res> {
  __$PingGlobalStatsCopyWithImpl(
      _PingGlobalStats _value, $Res Function(_PingGlobalStats) _then)
      : super(_value, (v) => _then(v as _PingGlobalStats));

  @override
  _PingGlobalStats get _value => super._value as _PingGlobalStats;

  @override
  $Res call({
    Object min = freezed,
    Object mean = freezed,
    Object max = freezed,
  }) {
    return _then(_PingGlobalStats(
      min: min == freezed ? _value.min : min as List<PingGroup>,
      mean: mean == freezed ? _value.mean : mean as List<PingGroup>,
      max: max == freezed ? _value.max : max as List<PingGroup>,
    ));
  }
}

@JsonSerializable()
class _$_PingGlobalStats implements _PingGlobalStats {
  _$_PingGlobalStats(
      {@required this.min, @required this.mean, @required this.max})
      : assert(min != null),
        assert(mean != null),
        assert(max != null);

  factory _$_PingGlobalStats.fromJson(Map<String, dynamic> json) =>
      _$_$_PingGlobalStatsFromJson(json);

  @override
  final List<PingGroup> min;
  @override
  final List<PingGroup> mean;
  @override
  final List<PingGroup> max;

  @override
  String toString() {
    return 'PingGroupStats(min: $min, mean: $mean, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingGlobalStats &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.mean, mean) ||
                const DeepCollectionEquality().equals(other.mean, mean)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(mean) ^
      const DeepCollectionEquality().hash(max);

  @override
  _$PingGlobalStatsCopyWith<_PingGlobalStats> get copyWith =>
      __$PingGlobalStatsCopyWithImpl<_PingGlobalStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingGlobalStatsToJson(this);
  }
}

abstract class _PingGlobalStats implements PingGroupStats {
  factory _PingGlobalStats(
      {@required List<PingGroup> min,
      @required List<PingGroup> mean,
      @required List<PingGroup> max}) = _$_PingGlobalStats;

  factory _PingGlobalStats.fromJson(Map<String, dynamic> json) =
      _$_PingGlobalStats.fromJson;

  @override
  List<PingGroup> get min;
  @override
  List<PingGroup> get mean;
  @override
  List<PingGroup> get max;
  @override
  _$PingGlobalStatsCopyWith<_PingGlobalStats> get copyWith;
}

PingGroup _$PingGroupFromJson(Map<String, dynamic> json) {
  return _PingGroup.fromJson(json);
}

class _$PingGroupTearOff {
  const _$PingGroupTearOff();

  _PingGroup call({@required double ping, @required double percentage}) {
    return _PingGroup(
      ping: ping,
      percentage: percentage,
    );
  }
}

// ignore: unused_element
const $PingGroup = _$PingGroupTearOff();

mixin _$PingGroup {
  double get ping;
  double get percentage;

  Map<String, dynamic> toJson();
  $PingGroupCopyWith<PingGroup> get copyWith;
}

abstract class $PingGroupCopyWith<$Res> {
  factory $PingGroupCopyWith(PingGroup value, $Res Function(PingGroup) then) =
      _$PingGroupCopyWithImpl<$Res>;
  $Res call({double ping, double percentage});
}

class _$PingGroupCopyWithImpl<$Res> implements $PingGroupCopyWith<$Res> {
  _$PingGroupCopyWithImpl(this._value, this._then);

  final PingGroup _value;
  // ignore: unused_field
  final $Res Function(PingGroup) _then;

  @override
  $Res call({
    Object ping = freezed,
    Object percentage = freezed,
  }) {
    return _then(_value.copyWith(
      ping: ping == freezed ? _value.ping : ping as double,
      percentage:
          percentage == freezed ? _value.percentage : percentage as double,
    ));
  }
}

abstract class _$PingGroupCopyWith<$Res> implements $PingGroupCopyWith<$Res> {
  factory _$PingGroupCopyWith(
          _PingGroup value, $Res Function(_PingGroup) then) =
      __$PingGroupCopyWithImpl<$Res>;
  @override
  $Res call({double ping, double percentage});
}

class __$PingGroupCopyWithImpl<$Res> extends _$PingGroupCopyWithImpl<$Res>
    implements _$PingGroupCopyWith<$Res> {
  __$PingGroupCopyWithImpl(_PingGroup _value, $Res Function(_PingGroup) _then)
      : super(_value, (v) => _then(v as _PingGroup));

  @override
  _PingGroup get _value => super._value as _PingGroup;

  @override
  $Res call({
    Object ping = freezed,
    Object percentage = freezed,
  }) {
    return _then(_PingGroup(
      ping: ping == freezed ? _value.ping : ping as double,
      percentage:
          percentage == freezed ? _value.percentage : percentage as double,
    ));
  }
}

@JsonSerializable()
class _$_PingGroup implements _PingGroup {
  _$_PingGroup({@required this.ping, @required this.percentage})
      : assert(ping != null),
        assert(percentage != null);

  factory _$_PingGroup.fromJson(Map<String, dynamic> json) =>
      _$_$_PingGroupFromJson(json);

  @override
  final double ping;
  @override
  final double percentage;

  @override
  String toString() {
    return 'PingGroup(ping: $ping, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingGroup &&
            (identical(other.ping, ping) ||
                const DeepCollectionEquality().equals(other.ping, ping)) &&
            (identical(other.percentage, percentage) ||
                const DeepCollectionEquality()
                    .equals(other.percentage, percentage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ping) ^
      const DeepCollectionEquality().hash(percentage);

  @override
  _$PingGroupCopyWith<_PingGroup> get copyWith =>
      __$PingGroupCopyWithImpl<_PingGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingGroupToJson(this);
  }
}

abstract class _PingGroup implements PingGroup {
  factory _PingGroup({@required double ping, @required double percentage}) =
      _$_PingGroup;

  factory _PingGroup.fromJson(Map<String, dynamic> json) =
      _$_PingGroup.fromJson;

  @override
  double get ping;
  @override
  double get percentage;
  @override
  _$PingGroupCopyWith<_PingGroup> get copyWith;
}
