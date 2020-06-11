// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'data_snap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DataSnapTearOff {
  const _$DataSnapTearOff();

  SnapData<T> data<T>(T value) {
    return SnapData<T>(
      value,
    );
  }

  SnapLoading<T> loading<T>() {
    return SnapLoading<T>();
  }

  SnapError<T> error<T>() {
    return SnapError<T>();
  }
}

// ignore: unused_element
const $DataSnap = _$DataSnapTearOff();

mixin _$DataSnap<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(T value),
    @required Result loading(),
    @required Result error(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(T value),
    Result loading(),
    Result error(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(SnapData<T> value),
    @required Result loading(SnapLoading<T> value),
    @required Result error(SnapError<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(SnapData<T> value),
    Result loading(SnapLoading<T> value),
    Result error(SnapError<T> value),
    @required Result orElse(),
  });
}

abstract class $DataSnapCopyWith<T, $Res> {
  factory $DataSnapCopyWith(
          DataSnap<T> value, $Res Function(DataSnap<T>) then) =
      _$DataSnapCopyWithImpl<T, $Res>;
}

class _$DataSnapCopyWithImpl<T, $Res> implements $DataSnapCopyWith<T, $Res> {
  _$DataSnapCopyWithImpl(this._value, this._then);

  final DataSnap<T> _value;
  // ignore: unused_field
  final $Res Function(DataSnap<T>) _then;
}

abstract class $SnapDataCopyWith<T, $Res> {
  factory $SnapDataCopyWith(
          SnapData<T> value, $Res Function(SnapData<T>) then) =
      _$SnapDataCopyWithImpl<T, $Res>;
  $Res call({T value});
}

class _$SnapDataCopyWithImpl<T, $Res> extends _$DataSnapCopyWithImpl<T, $Res>
    implements $SnapDataCopyWith<T, $Res> {
  _$SnapDataCopyWithImpl(SnapData<T> _value, $Res Function(SnapData<T>) _then)
      : super(_value, (v) => _then(v as SnapData<T>));

  @override
  SnapData<T> get _value => super._value as SnapData<T>;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(SnapData<T>(
      value == freezed ? _value.value : value as T,
    ));
  }
}

class _$SnapData<T> implements SnapData<T> {
  const _$SnapData(this.value) : assert(value != null);

  @override
  final T value;

  @override
  String toString() {
    return 'DataSnap<$T>.data(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SnapData<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $SnapDataCopyWith<T, SnapData<T>> get copyWith =>
      _$SnapDataCopyWithImpl<T, SnapData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(T value),
    @required Result loading(),
    @required Result error(),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(T value),
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(SnapData<T> value),
    @required Result loading(SnapLoading<T> value),
    @required Result error(SnapError<T> value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(SnapData<T> value),
    Result loading(SnapLoading<T> value),
    Result error(SnapError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class SnapData<T> implements DataSnap<T> {
  const factory SnapData(T value) = _$SnapData<T>;

  T get value;
  $SnapDataCopyWith<T, SnapData<T>> get copyWith;
}

abstract class $SnapLoadingCopyWith<T, $Res> {
  factory $SnapLoadingCopyWith(
          SnapLoading<T> value, $Res Function(SnapLoading<T>) then) =
      _$SnapLoadingCopyWithImpl<T, $Res>;
}

class _$SnapLoadingCopyWithImpl<T, $Res> extends _$DataSnapCopyWithImpl<T, $Res>
    implements $SnapLoadingCopyWith<T, $Res> {
  _$SnapLoadingCopyWithImpl(
      SnapLoading<T> _value, $Res Function(SnapLoading<T>) _then)
      : super(_value, (v) => _then(v as SnapLoading<T>));

  @override
  SnapLoading<T> get _value => super._value as SnapLoading<T>;
}

class _$SnapLoading<T> implements SnapLoading<T> {
  const _$SnapLoading();

  @override
  String toString() {
    return 'DataSnap<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SnapLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(T value),
    @required Result loading(),
    @required Result error(),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(T value),
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(SnapData<T> value),
    @required Result loading(SnapLoading<T> value),
    @required Result error(SnapError<T> value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(SnapData<T> value),
    Result loading(SnapLoading<T> value),
    Result error(SnapError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SnapLoading<T> implements DataSnap<T> {
  const factory SnapLoading() = _$SnapLoading<T>;
}

abstract class $SnapErrorCopyWith<T, $Res> {
  factory $SnapErrorCopyWith(
          SnapError<T> value, $Res Function(SnapError<T>) then) =
      _$SnapErrorCopyWithImpl<T, $Res>;
}

class _$SnapErrorCopyWithImpl<T, $Res> extends _$DataSnapCopyWithImpl<T, $Res>
    implements $SnapErrorCopyWith<T, $Res> {
  _$SnapErrorCopyWithImpl(
      SnapError<T> _value, $Res Function(SnapError<T>) _then)
      : super(_value, (v) => _then(v as SnapError<T>));

  @override
  SnapError<T> get _value => super._value as SnapError<T>;
}

class _$SnapError<T> implements SnapError<T> {
  const _$SnapError();

  @override
  String toString() {
    return 'DataSnap<$T>.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SnapError<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(T value),
    @required Result loading(),
    @required Result error(),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(T value),
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(SnapData<T> value),
    @required Result loading(SnapLoading<T> value),
    @required Result error(SnapError<T> value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(SnapData<T> value),
    Result loading(SnapLoading<T> value),
    Result error(SnapError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SnapError<T> implements DataSnap<T> {
  const factory SnapError() = _$SnapError<T>;
}
