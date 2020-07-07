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

  @override
  bool updateShouldNotify(HostIconProvider old) => old.getIcon != getIcon;
}

class HostIconTile extends StatefulWidget {
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
  _HostIconTileState createState() => _HostIconTileState();
}

class _HostIconTileState extends State<HostIconTile> {
  Observable<DataSnap<Uint8List>> _iconObservable;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateIcon();
  }

  @override
  void didUpdateWidget(HostIconTile old) {
    super.didUpdateWidget(old);
    if (old.host != widget.host) _updateIcon();
  }

  void _updateIcon() => _iconObservable = context
      .dependOnInheritedWidgetOfExactType<HostIconProvider>()
      .getIcon(widget.host);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(36.0),
      child: TweenAnimationBuilder<Color>(
        tween: ColorTween(begin: widget.shadowColor, end: widget.shadowColor),
        duration: widget.duration,
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
          builder: (_) => _iconObservable.value.maybeWhen(
            data: (it) => Image.memory(it, width: 24.0, height: 24.0),
            orElse: () =>
                Icon(Icons.language, color: R.colors.gray, size: 24.0),
          ),
        ),
      ),
    );
  }
}
