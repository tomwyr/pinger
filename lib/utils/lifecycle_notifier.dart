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
        _listeners.forEach((it) => it.onPaused());
        break;
      case AppLifecycleState.resumed:
        _listeners.forEach((it) => it.onResumed());
        break;
      case AppLifecycleState.detached:
        _listeners.forEach((it) => it.onDetached());
        break;
      case AppLifecycleState.inactive:
        _listeners.forEach((it) => it.onInactive());
        break;
    }
  }
}

class LifecycleAware {
  factory LifecycleAware({
    VoidCallback onPaused,
    VoidCallback onResumed,
    VoidCallback onInactive,
    VoidCallback onDetached,
  }) =>
      _FunLifecycleAware(onPaused, onResumed, onInactive, onDetached);

  void onPaused() {}
  void onResumed() {}
  void onInactive() {}
  void onDetached() {}
}

class _FunLifecycleAware implements LifecycleAware {
  final VoidCallback _onPaused;
  final VoidCallback _onResumed;
  final VoidCallback _onInactive;
  final VoidCallback _onDetached;

  _FunLifecycleAware(
    this._onPaused,
    this._onResumed,
    this._onInactive,
    this._onDetached,
  );

  @override
  void onPaused() => _onPaused?.call();

  @override
  void onResumed() => _onResumed?.call();

  @override
  void onInactive() => _onInactive?.call();

  @override
  void onDetached() => _onDetached?.call();
}
