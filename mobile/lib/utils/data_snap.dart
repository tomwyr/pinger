import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_snap.freezed.dart';

@freezed
class DataSnap<T> with _$DataSnap<T> {
  const factory DataSnap.data(T value) = SnapData<T>;
  const factory DataSnap.loading() = SnapLoading<T>;
  const factory DataSnap.error() = SnapError<T>;
}
