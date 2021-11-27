// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_snap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
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

/// @nodoc
const $DataSnap = _$DataSnapTearOff();

/// @nodoc
mixin _$DataSnap<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) data,
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SnapData<T> value) data,
    required TResult Function(SnapLoading<T> value) loading,
    required TResult Function(SnapError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSnapCopyWith<T, $Res> {
  factory $DataSnapCopyWith(DataSnap<T> value, $Res Function(DataSnap<T>) then) =
      _$DataSnapCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$DataSnapCopyWithImpl<T, $Res> implements $DataSnapCopyWith<T, $Res> {
  _$DataSnapCopyWithImpl(this._value, this._then);

  final DataSnap<T> _value;
  // ignore: unused_field
  final $Res Function(DataSnap<T>) _then;
}

/// @nodoc
abstract class $SnapDataCopyWith<T, $Res> {
  factory $SnapDataCopyWith(SnapData<T> value, $Res Function(SnapData<T>) then) =
      _$SnapDataCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class _$SnapDataCopyWithImpl<T, $Res> extends _$DataSnapCopyWithImpl<T, $Res>
    implements $SnapDataCopyWith<T, $Res> {
  _$SnapDataCopyWithImpl(SnapData<T> _value, $Res Function(SnapData<T>) _then)
      : super(_value, (v) => _then(v as SnapData<T>));

  @override
  SnapData<T> get _value => super._value as SnapData<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(SnapData<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SnapData<T> implements SnapData<T> {
  const _$SnapData(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'DataSnap<$T>.data(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SnapData<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $SnapDataCopyWith<T, SnapData<T>> get copyWith =>
      _$SnapDataCopyWithImpl<T, SnapData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return data(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
  }) {
    return data?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SnapData<T> value) data,
    required TResult Function(SnapLoading<T> value) loading,
    required TResult Function(SnapError<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class SnapData<T> implements DataSnap<T> {
  const factory SnapData(T value) = _$SnapData<T>;

  T get value;
  @JsonKey(ignore: true)
  $SnapDataCopyWith<T, SnapData<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapLoadingCopyWith<T, $Res> {
  factory $SnapLoadingCopyWith(SnapLoading<T> value, $Res Function(SnapLoading<T>) then) =
      _$SnapLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$SnapLoadingCopyWithImpl<T, $Res> extends _$DataSnapCopyWithImpl<T, $Res>
    implements $SnapLoadingCopyWith<T, $Res> {
  _$SnapLoadingCopyWithImpl(SnapLoading<T> _value, $Res Function(SnapLoading<T>) _then)
      : super(_value, (v) => _then(v as SnapLoading<T>));

  @override
  SnapLoading<T> get _value => super._value as SnapLoading<T>;
}

/// @nodoc

class _$SnapLoading<T> implements SnapLoading<T> {
  const _$SnapLoading();

  @override
  String toString() {
    return 'DataSnap<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SnapLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SnapData<T> value) data,
    required TResult Function(SnapLoading<T> value) loading,
    required TResult Function(SnapError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SnapLoading<T> implements DataSnap<T> {
  const factory SnapLoading() = _$SnapLoading<T>;
}

/// @nodoc
abstract class $SnapErrorCopyWith<T, $Res> {
  factory $SnapErrorCopyWith(SnapError<T> value, $Res Function(SnapError<T>) then) =
      _$SnapErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$SnapErrorCopyWithImpl<T, $Res> extends _$DataSnapCopyWithImpl<T, $Res>
    implements $SnapErrorCopyWith<T, $Res> {
  _$SnapErrorCopyWithImpl(SnapError<T> _value, $Res Function(SnapError<T>) _then)
      : super(_value, (v) => _then(v as SnapError<T>));

  @override
  SnapError<T> get _value => super._value as SnapError<T>;
}

/// @nodoc

class _$SnapError<T> implements SnapError<T> {
  const _$SnapError();

  @override
  String toString() {
    return 'DataSnap<$T>.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SnapError<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SnapData<T> value) data,
    required TResult Function(SnapLoading<T> value) loading,
    required TResult Function(SnapError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SnapData<T> value)? data,
    TResult Function(SnapLoading<T> value)? loading,
    TResult Function(SnapError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SnapError<T> implements DataSnap<T> {
  const factory SnapError() = _$SnapError<T>;
}
