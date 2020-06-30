import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class HostIconProvider extends InheritedWidget {
  const HostIconProvider({
    Key key,
    @required Widget child,
    @required this.provide,
  }) : super(key: key, child: child);

  final Future<Uint8List> Function(String url) provide;

  static HostIconProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(HostIconProvider old) => old.provide != provide;
}

class HostIconTile extends StatelessWidget {
  final String host;
  final Duration duration;
  final Color shadowColor;

  HostIconTile._({
    Key key,
    @required this.host,
    @required this.duration,
    @required this.shadowColor,
  }) : super(key: key);

  HostIconTile({
    Key key,
    @required String host,
    bool isRaised = true,
  }) : this._(
          key: key,
          host: host,
          duration: const Duration(seconds: 1),
          shadowColor: isRaised ? R.colors.shadow : R.colors.none,
        );

  HostIconTile.expansion({
    Key key,
    @required String host,
    @required double expansion,
  }) : this._(
          key: key,
          host: host,
          duration: Duration.zero,
          shadowColor: ColorTween(
            begin: R.colors.none,
            end: R.colors.shadow,
          ).transform(expansion),
        );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: host != null
          ? HostIconProvider.of(context).provide(host)
          : Future.value(null),
      initialData: host != null ? Uint8List(0) : null,
      builder: (_, snap) => SizedBox.fromSize(
        size: Size.square(36.0),
        child: TweenAnimationBuilder<Color>(
          tween: ColorTween(begin: shadowColor, end: shadowColor),
          duration: duration,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child:
                  snap.hasData && snap.connectionState == ConnectionState.done
                      ? snap.data.isNotEmpty
                          ? Image.memory(snap.data, width: 24.0, height: 24.0)
                          : SizedBox.shrink()
                      : Icon(Icons.language, color: R.colors.gray, size: 24.0),
            ),
          ),
          builder: (_, value, child) => DecoratedBox(
            decoration: BoxDecoration(
              color: R.colors.canvas,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: value,
                  spreadRadius: 1.0,
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
