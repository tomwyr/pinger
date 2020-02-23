// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

part of 'archive_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ArchiveViewType {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result list(),
    @required Result groups(),
    @required Result host(String name),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result list(),
    Result groups(),
    Result host(String name),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result list(ArchiveListView value),
    @required Result groups(ArchiveGroupsView value),
    @required Result host(ArchiveHostView value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result list(ArchiveListView value),
    Result groups(ArchiveGroupsView value),
    Result host(ArchiveHostView value),
    @required Result orElse(),
  });
}

class _$ArchiveListView
    with DiagnosticableTreeMixin
    implements ArchiveListView {
  const _$ArchiveListView();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArchiveViewType.list()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ArchiveViewType.list'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ArchiveListView);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result list(),
    @required Result groups(),
    @required Result host(String name),
  }) {
    assert(list != null);
    assert(groups != null);
    assert(host != null);
    return list();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result list(),
    Result groups(),
    Result host(String name),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (list != null) {
      return list();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result list(ArchiveListView value),
    @required Result groups(ArchiveGroupsView value),
    @required Result host(ArchiveHostView value),
  }) {
    assert(list != null);
    assert(groups != null);
    assert(host != null);
    return list(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result list(ArchiveListView value),
    Result groups(ArchiveGroupsView value),
    Result host(ArchiveHostView value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (list != null) {
      return list(this);
    }
    return orElse();
  }
}

abstract class ArchiveListView implements ArchiveViewType {
  const factory ArchiveListView() = _$ArchiveListView;
}

class _$ArchiveGroupsView
    with DiagnosticableTreeMixin
    implements ArchiveGroupsView {
  const _$ArchiveGroupsView();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArchiveViewType.groups()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ArchiveViewType.groups'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ArchiveGroupsView);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result list(),
    @required Result groups(),
    @required Result host(String name),
  }) {
    assert(list != null);
    assert(groups != null);
    assert(host != null);
    return groups();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result list(),
    Result groups(),
    Result host(String name),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (groups != null) {
      return groups();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result list(ArchiveListView value),
    @required Result groups(ArchiveGroupsView value),
    @required Result host(ArchiveHostView value),
  }) {
    assert(list != null);
    assert(groups != null);
    assert(host != null);
    return groups(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result list(ArchiveListView value),
    Result groups(ArchiveGroupsView value),
    Result host(ArchiveHostView value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (groups != null) {
      return groups(this);
    }
    return orElse();
  }
}

abstract class ArchiveGroupsView implements ArchiveViewType {
  const factory ArchiveGroupsView() = _$ArchiveGroupsView;
}

class _$ArchiveHostView
    with DiagnosticableTreeMixin
    implements ArchiveHostView {
  const _$ArchiveHostView({this.name});

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArchiveViewType.host(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArchiveViewType.host'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ArchiveHostView &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;

  @override
  _$ArchiveHostView copyWith({
    Object name = freezed,
  }) {
    return _$ArchiveHostView(
      name: name == freezed ? this.name : name as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result list(),
    @required Result groups(),
    @required Result host(String name),
  }) {
    assert(list != null);
    assert(groups != null);
    assert(host != null);
    return host(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result list(),
    Result groups(),
    Result host(String name),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (host != null) {
      return host(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result list(ArchiveListView value),
    @required Result groups(ArchiveGroupsView value),
    @required Result host(ArchiveHostView value),
  }) {
    assert(list != null);
    assert(groups != null);
    assert(host != null);
    return host(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result list(ArchiveListView value),
    Result groups(ArchiveGroupsView value),
    Result host(ArchiveHostView value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (host != null) {
      return host(this);
    }
    return orElse();
  }
}

abstract class ArchiveHostView implements ArchiveViewType {
  const factory ArchiveHostView({String name}) = _$ArchiveHostView;

  String get name;

  ArchiveHostView copyWith({String name});
}
