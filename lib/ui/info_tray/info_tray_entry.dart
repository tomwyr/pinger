import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:pinger/ui/common/draggable_sheet.dart';
import 'package:pinger/ui/info_tray/info_tray.dart';

class InfoTrayEntry<T> implements SeparatedItem<InfoTrayItem> {
  InfoTrayEntry({
    required this.item,
    required this.valueObservable,
    required this.valueBuilder,
    required this.isVisible,
  });

  final InfoTrayItem item;
  final ValueGetter<T> valueObservable;
  final Widget Function(T value) valueBuilder;
  final bool Function(T value) isVisible;
  final ValueNotifier<bool?> visibility = ValueNotifier(null);

  late ReactionDisposer _reactionDisposer;

  void init() {
    _reactionDisposer = reaction<bool>(
      (_) => isVisible(valueObservable()),
      (dynamic it) => visibility.value = it,
      fireImmediately: true,
    );
  }

  void dispose() {
    _reactionDisposer();
    visibility.dispose();
  }

  @override
  InfoTrayItem get value => item;

  @override
  WidgetBuilder get builder => (_) => Observer(builder: (_) => valueBuilder(valueObservable()));
}
