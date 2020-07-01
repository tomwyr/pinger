import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/utils/data_snap.dart';

typedef HostIconGetter = Observable<DataSnap<Uint8List>> Function(String url);

class HostIconProvider extends InheritedWidget {
  const HostIconProvider({
    Key key,
    @required Widget child,
    @required this.getIcon,
  }) : super(key: key, child: child);

  final HostIconGetter getIcon;

  static HostIconProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(HostIconProvider old) => old.getIcon != getIcon;
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
    return SizedBox.fromSize(
      size: Size.square(36.0),
      child: TweenAnimationBuilder<Color>(
        tween: ColorTween(begin: shadowColor, end: shadowColor),
        duration: duration,
        child: _buildIcon(context),
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
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Observer(
          builder: (_) => HostIconProvider.of(context).getIcon(host).value.when(
                data: (it) => Image.memory(it, width: 24.0, height: 24.0),
                loading: () => SizedBox.shrink(),
                error: () =>
                    Icon(Icons.language, color: R.colors.gray, size: 24.0),
              ),
        ),
      ),
    );
  }
}
