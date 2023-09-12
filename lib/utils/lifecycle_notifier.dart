import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LifecycleNotifier extends WidgetsBindingObserver {
  LifecycleNotifier() {
    WidgetsBinding.instance.addObserver(this);
  }

  final Set<LifecycleAware> _listeners = {};

  void register(LifecycleAware listener) => _listeners.add(listener);

  void unregister(LifecycleAware listener) => _listeners.remove(listener);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        for (var it in _listeners) {
          it.onPaused();
        }
        break;
      case AppLifecycleState.resumed:
        for (var it in _listeners) {
          it.onResumed();
        }
        break;
      case AppLifecycleState.detached:
        for (var it in _listeners) {
          it.onDetached();
        }
        break;
      case AppLifecycleState.inactive:
        for (var it in _listeners) {
          it.onInactive();
        }
        break;
      case AppLifecycleState.hidden:
        for (var it in _listeners) {
          it.onHidden();
        }
        break;
    }
  }
}

mixin class LifecycleAware {
  factory LifecycleAware({
    VoidCallback? onPaused,
    VoidCallback? onResumed,
    VoidCallback? onInactive,
    VoidCallback? onDetached,
    VoidCallback? onHidden,
  }) =>
      _FunLifecycleAware(
        onPaused,
        onResumed,
        onInactive,
        onDetached,
        onHidden,
      );

  void onPaused() {}
  void onResumed() {}
  void onInactive() {}
  void onDetached() {}
  void onHidden() {}
}

class _FunLifecycleAware implements LifecycleAware {
  _FunLifecycleAware(
    this._onPaused,
    this._onResumed,
    this._onInactive,
    this._onDetached,
    this._onHidden,
  );

  final VoidCallback? _onPaused;
  final VoidCallback? _onResumed;
  final VoidCallback? _onInactive;
  final VoidCallback? _onDetached;
  final VoidCallback? _onHidden;

  @override
  void onPaused() => _onPaused?.call();

  @override
  void onResumed() => _onResumed?.call();

  @override
  void onInactive() => _onInactive?.call();

  @override
  void onDetached() => _onDetached?.call();

  @override
  void onHidden() => _onHidden?.call();
}
