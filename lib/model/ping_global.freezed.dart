// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ping_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

PingGlobalResults _$PingGlobalResultsFromJson(Map<String, dynamic> json) {
  return _PingGlobalResults.fromJson(json);
}

mixin _$PingGlobalResults {
  List<PingGeoStats> get geoStats;
  PingGroupStats get groupStats;

  PingGlobalResults copyWith(
      {List<PingGeoStats> geoStats, PingGroupStats groupStats});

  Map<String, dynamic> toJson();
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

const $PingGlobalResults = _$PingGlobalResultsTearOff();

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
  _$_PingGlobalResults copyWith({
    Object geoStats = freezed,
    Object groupStats = freezed,
  }) {
    return _$_PingGlobalResults(
      geoStats:
          geoStats == freezed ? this.geoStats : geoStats as List<PingGeoStats>,
      groupStats: groupStats == freezed
          ? this.groupStats
          : groupStats as PingGroupStats,
    );
  }

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
  _PingGlobalResults copyWith(
      {List<PingGeoStats> geoStats, PingGroupStats groupStats});
}

PingGeoStats _$PingGeoStatsFromJson(Map<String, dynamic> json) {
  return _PingGeoStats.fromJson(json);
}

mixin _$PingGeoStats {
  GeoPosition get position;
  PingStats get stats;

  PingGeoStats copyWith({GeoPosition position, PingStats stats});

  Map<String, dynamic> toJson();
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

const $PingGeoStats = _$PingGeoStatsTearOff();

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
  _$_PingGeoStats copyWith({
    Object position = freezed,
    Object stats = freezed,
  }) {
    return _$_PingGeoStats(
      position: position == freezed ? this.position : position as GeoPosition,
      stats: stats == freezed ? this.stats : stats as PingStats,
    );
  }

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
  _PingGeoStats copyWith({GeoPosition position, PingStats stats});
}

GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return _GeoPosition.fromJson(json);
}

mixin _$GeoPosition {
  double get lat;
  double get lon;

  GeoPosition copyWith({double lat, double lon});

  Map<String, dynamic> toJson();
}

class _$GeoPositionTearOff {
  const _$GeoPositionTearOff();

  _GeoPosition call({@required double lat, @required double lon}) {
    return _GeoPosition(
      lat: lat,
      lon: lon,
    );
  }
}

const $GeoPosition = _$GeoPositionTearOff();

@JsonSerializable()
class _$_GeoPosition implements _GeoPosition {
  _$_GeoPosition({@required this.lat, @required this.lon})
      : assert(lat != null),
        assert(lon != null);

  factory _$_GeoPosition.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoPositionFromJson(json);

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'GeoPosition(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoPosition &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon);

  @override
  _$_GeoPosition copyWith({
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _$_GeoPosition(
      lat: lat == freezed ? this.lat : lat as double,
      lon: lon == freezed ? this.lon : lon as double,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoPositionToJson(this);
  }
}

abstract class _GeoPosition implements GeoPosition {
  factory _GeoPosition({@required double lat, @required double lon}) =
      _$_GeoPosition;

  factory _GeoPosition.fromJson(Map<String, dynamic> json) =
      _$_GeoPosition.fromJson;

  @override
  double get lat;
  @override
  double get lon;

  @override
  _GeoPosition copyWith({double lat, double lon});
}

PingGroupStats _$PingGroupStatsFromJson(Map<String, dynamic> json) {
  return _PingGlobalStats.fromJson(json);
}

mixin _$PingGroupStats {
  List<PingGroup> get min;
  List<PingGroup> get mean;
  List<PingGroup> get max;

  PingGroupStats copyWith(
      {List<PingGroup> min, List<PingGroup> mean, List<PingGroup> max});

  Map<String, dynamic> toJson();
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

const $PingGroupStats = _$PingGroupStatsTearOff();

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
  _$_PingGlobalStats copyWith({
    Object min = freezed,
    Object mean = freezed,
    Object max = freezed,
  }) {
    return _$_PingGlobalStats(
      min: min == freezed ? this.min : min as List<PingGroup>,
      mean: mean == freezed ? this.mean : mean as List<PingGroup>,
      max: max == freezed ? this.max : max as List<PingGroup>,
    );
  }

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
  _PingGlobalStats copyWith(
      {List<PingGroup> min, List<PingGroup> mean, List<PingGroup> max});
}

PingGroup _$PingGroupFromJson(Map<String, dynamic> json) {
  return _PingGroup.fromJson(json);
}

mixin _$PingGroup {
  double get ping;
  double get percentage;

  PingGroup copyWith({double ping, double percentage});

  Map<String, dynamic> toJson();
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

const $PingGroup = _$PingGroupTearOff();

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
  _$_PingGroup copyWith({
    Object ping = freezed,
    Object percentage = freezed,
  }) {
    return _$_PingGroup(
      ping: ping == freezed ? this.ping : ping as double,
      percentage:
          percentage == freezed ? this.percentage : percentage as double,
    );
  }

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
  _PingGroup copyWith({double ping, double percentage});
}
