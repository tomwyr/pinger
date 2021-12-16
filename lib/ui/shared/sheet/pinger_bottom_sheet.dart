import 'package:flutter/material.dart';

import 'package:pinger/resources.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';

class PingerBottomSheet extends StatelessWidget {
  const PingerBottomSheet._({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.acceptIcon,
    required this.rejectLabel,
    required this.onRejectPressed,
    required this.onAcceptPressed,
    required this.canAccept,
    required this.didPop,
    required this.animation,
    required this.builder,
  }) : super(key: key);

  static Future<T?> show<T>({
    Widget? title,
    Widget? subtitle,
    IconData? acceptIcon,
    String? rejectLabel,
    VoidCallback? onRejectPressed,
    VoidCallback? onAcceptPressed,
    ValueGetter<bool>? canAccept,
    Widget Function(VoidCallback rebuild)? builder,
  }) async {
    var didPop = false;
    final result = await PingerApp.router.show<T>(RouteConfig.sheet(
      (_, animation, __) => PingerBottomSheet._(
        title: title,
        subtitle: subtitle,
        acceptIcon: acceptIcon ?? Icons.check,
        rejectLabel: rejectLabel,
        onRejectPressed: onRejectPressed,
        onAcceptPressed: onAcceptPressed,
        canAccept: canAccept,
        didPop: () => didPop,
        animation: animation,
        builder: builder ?? (_) => const SizedBox.shrink(),
      ),
    ));
    didPop = true;
    return result;
  }

  final Animation<double> animation;
  final Widget? title;
  final Widget? subtitle;
  final IconData acceptIcon;
  final String? rejectLabel;
  final VoidCallback? onRejectPressed;
  final VoidCallback? onAcceptPressed;
  final ValueGetter<bool>? canAccept;
  final ValueGetter<bool> didPop;
  final Widget Function(VoidCallback) builder;

  void _tryPop() {
    if (!didPop()) PingerApp.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: GestureDetector(onTap: _tryPop)),
        Align(alignment: Alignment.bottomCenter, child: _buildSheetBox()),
      ],
    );
  }

  Widget _buildSheetBox() {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => FractionalTranslation(
        translation: Offset(0.0, 1.0 - animation.value),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 32.0,
          ).add(EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          )),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
            color: R.colors.canvas,
            boxShadow: [
              BoxShadow(
                color: R.colors.shadow,
                spreadRadius: 1.0,
                blurRadius: 8.0,
              ),
            ],
          ),
          child: child,
        ),
      ),
      child: Material(child: _buildSheetContent()),
    );
  }

  Widget _buildSheetContent() {
    return StatefulBuilder(
      builder: (_, setState) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null) title!,
          if (title != null && subtitle != null) Container(height: 8.0),
          if (subtitle != null) subtitle!,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: builder(() => setState(() {})),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (rejectLabel != null)
                TextButton(
                  style: R.themes.app.textButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: onRejectPressed ?? _tryPop,
                  child: Text(rejectLabel!),
                ),
              if (rejectLabel != null) const Spacer(),
              SizedBox.fromSize(
                size: const Size.square(48.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: canAccept == null || canAccept!() ? onAcceptPressed ?? _tryPop : null,
                  child: Icon(acceptIcon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
