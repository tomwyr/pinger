import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class HostIconTile extends StatelessWidget {
  final String url;
  final Duration duration;
  final Color shadowColor;

  HostIconTile._({
    Key key,
    @required this.url,
    @required this.duration,
    @required this.shadowColor,
  }) : super(key: key);

  HostIconTile({
    Key key,
    @required String url,
    bool isRaised = true,
  }) : this._(
          key: key,
          url: url,
          duration: const Duration(seconds: 1),
          shadowColor: isRaised ? R.colors.shadow : R.colors.none,
        );

  HostIconTile.expansion({
    Key key,
    @required String url,
    @required double expansion,
  }) : this._(
          key: key,
          url: url,
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
        child: Center(
          child: Image.network(url, width: 24.0, height: 24.0),
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
    );
  }
}
