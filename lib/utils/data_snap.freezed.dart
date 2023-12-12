// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_snap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function(T value)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
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
    TResult? Function(SnapData<T> value)? data,
    TResult? Function(SnapLoading<T> value)? loading,
    TResult? Function(SnapError<T> value)? error,
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
  factory $DataSnapCopyWith(
          DataSnap<T> value, $Res Function(DataSnap<T>) then) =
      _$DataSnapCopyWithImpl<T, $Res, DataSnap<T>>;
}

/// @nodoc
class _$DataSnapCopyWithImpl<T, $Res, $Val extends DataSnap<T>>
    implements $DataSnapCopyWith<T, $Res> {
  _$DataSnapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SnapDataImplCopyWith<T, $Res> {
  factory _$$SnapDataImplCopyWith(
          _$SnapDataImpl<T> value, $Res Function(_$SnapDataImpl<T>) then) =
      __$$SnapDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$SnapDataImplCopyWithImpl<T, $Res>
    extends _$DataSnapCopyWithImpl<T, $Res, _$SnapDataImpl<T>>
    implements _$$SnapDataImplCopyWith<T, $Res> {
  __$$SnapDataImplCopyWithImpl(
      _$SnapDataImpl<T> _value, $Res Function(_$SnapDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$SnapDataImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SnapDataImpl<T> implements SnapData<T> {
  const _$SnapDataImpl(this.value);

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
            other is _$SnapDataImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnapDataImplCopyWith<T, _$SnapDataImpl<T>> get copyWith =>
      __$$SnapDataImplCopyWithImpl<T, _$SnapDataImpl<T>>(this, _$identity);

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
    TResult? Function(T value)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
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
    TResult? Function(SnapData<T> value)? data,
    TResult? Function(SnapLoading<T> value)? loading,
    TResult? Function(SnapError<T> value)? error,
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
  const factory SnapData(final T value) = _$SnapDataImpl<T>;

  T get value;
  @JsonKey(ignore: true)
  _$$SnapDataImplCopyWith<T, _$SnapDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SnapLoadingImplCopyWith<T, $Res> {
  factory _$$SnapLoadingImplCopyWith(_$SnapLoadingImpl<T> value,
          $Res Function(_$SnapLoadingImpl<T>) then) =
      __$$SnapLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SnapLoadingImplCopyWithImpl<T, $Res>
    extends _$DataSnapCopyWithImpl<T, $Res, _$SnapLoadingImpl<T>>
    implements _$$SnapLoadingImplCopyWith<T, $Res> {
  __$$SnapLoadingImplCopyWithImpl(
      _$SnapLoadingImpl<T> _value, $Res Function(_$SnapLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SnapLoadingImpl<T> implements SnapLoading<T> {
  const _$SnapLoadingImpl();

  @override
  String toString() {
    return 'DataSnap<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SnapLoadingImpl<T>);
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
    TResult? Function(T value)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
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
    TResult? Function(SnapData<T> value)? data,
    TResult? Function(SnapLoading<T> value)? loading,
    TResult? Function(SnapError<T> value)? error,
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
  const factory SnapLoading() = _$SnapLoadingImpl<T>;
}

/// @nodoc
abstract class _$$SnapErrorImplCopyWith<T, $Res> {
  factory _$$SnapErrorImplCopyWith(
          _$SnapErrorImpl<T> value, $Res Function(_$SnapErrorImpl<T>) then) =
      __$$SnapErrorImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SnapErrorImplCopyWithImpl<T, $Res>
    extends _$DataSnapCopyWithImpl<T, $Res, _$SnapErrorImpl<T>>
    implements _$$SnapErrorImplCopyWith<T, $Res> {
  __$$SnapErrorImplCopyWithImpl(
      _$SnapErrorImpl<T> _value, $Res Function(_$SnapErrorImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SnapErrorImpl<T> implements SnapError<T> {
  const _$SnapErrorImpl();

  @override
  String toString() {
    return 'DataSnap<$T>.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SnapErrorImpl<T>);
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
    TResult? Function(T value)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
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
    TResult? Function(SnapData<T> value)? data,
    TResult? Function(SnapLoading<T> value)? loading,
    TResult? Function(SnapError<T> value)? error,
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
  const factory SnapError() = _$SnapErrorImpl<T>;
}
