// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters

part of 'ping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

PingSession _$PingSessionFromJson(Map<String, dynamic> json) {
  return _PingSession.fromJson(json);
}

mixin _$PingSession {
  String get host;
  DateTime get timestamp;
  Duration get duration;
  PingResults get results;

  PingSession copyWith(
      {String host,
      DateTime timestamp,
      Duration duration,
      PingResults results});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_PingSession implements _PingSession {
  _$_PingSession(
      {@required this.host,
      @required this.timestamp,
      @required this.duration,
      @required this.results})
      : assert(host != null),
        assert(timestamp != null),
        assert(duration != null),
        assert(results != null);

  factory _$_PingSession.fromJson(Map<String, dynamic> json) =>
      _$_$_PingSessionFromJson(json);

  @override
  final String host;
  @override
  final DateTime timestamp;
  @override
  final Duration duration;
  @override
  final PingResults results;

  @override
  String toString() {
    return 'PingSession(host: $host, timestamp: $timestamp, duration: $duration, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingSession &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(results);

  @override
  _$_PingSession copyWith({
    Object host = freezed,
    Object timestamp = freezed,
    Object duration = freezed,
    Object results = freezed,
  }) {
    assert(host != null);
    assert(timestamp != null);
    assert(duration != null);
    assert(results != null);
    return _$_PingSession(
      host: host == freezed ? this.host : host as String,
      timestamp: timestamp == freezed ? this.timestamp : timestamp as DateTime,
      duration: duration == freezed ? this.duration : duration as Duration,
      results: results == freezed ? this.results : results as PingResults,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingSessionToJson(this);
  }
}

abstract class _PingSession implements PingSession {
  factory _PingSession(
      {@required String host,
      @required DateTime timestamp,
      @required Duration duration,
      @required PingResults results}) = _$_PingSession;

  factory _PingSession.fromJson(Map<String, dynamic> json) =
      _$_PingSession.fromJson;

  @override
  String get host;
  @override
  DateTime get timestamp;
  @override
  Duration get duration;
  @override
  PingResults get results;

  @override
  _PingSession copyWith(
      {String host,
      DateTime timestamp,
      Duration duration,
      PingResults results});
}

PingResults _$PingResultsFromJson(Map<String, dynamic> json) {
  return _PingResults.fromJson(json);
}

mixin _$PingResults {
  List<double> get values;
  double get min;
  double get max;
  double get mean;

  PingResults copyWith(
      {List<double> values, double min, double max, double mean});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_PingResults implements _PingResults {
  _$_PingResults(
      {@required this.values,
      @required this.min,
      @required this.max,
      @required this.mean})
      : assert(values != null),
        assert(min != null),
        assert(max != null),
        assert(mean != null);

  factory _$_PingResults.fromJson(Map<String, dynamic> json) =>
      _$_$_PingResultsFromJson(json);

  @override
  final List<double> values;
  @override
  final double min;
  @override
  final double max;
  @override
  final double mean;

  @override
  String toString() {
    return 'PingResults(values: $values, min: $min, max: $max, mean: $mean)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingResults &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)) &&
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
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(mean);

  @override
  _$_PingResults copyWith({
    Object values = freezed,
    Object min = freezed,
    Object max = freezed,
    Object mean = freezed,
  }) {
    assert(values != null);
    assert(min != null);
    assert(max != null);
    assert(mean != null);
    return _$_PingResults(
      values: values == freezed ? this.values : values as List<double>,
      min: min == freezed ? this.min : min as double,
      max: max == freezed ? this.max : max as double,
      mean: mean == freezed ? this.mean : mean as double,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingResultsToJson(this);
  }
}

abstract class _PingResults implements PingResults {
  factory _PingResults(
      {@required List<double> values,
      @required double min,
      @required double max,
      @required double mean}) = _$_PingResults;

  factory _PingResults.fromJson(Map<String, dynamic> json) =
      _$_PingResults.fromJson;

  @override
  List<double> get values;
  @override
  double get min;
  @override
  double get max;
  @override
  double get mean;

  @override
  _PingResults copyWith(
      {List<double> values, double min, double max, double mean});
}
