import 'package:flutter/rendering.dart';

typedef InlinePerformLayout = void Function(Size size, MultiChildLayoutDelegate self);
typedef InlineShouldRelayout = bool Function(InlineMultiChildLayoutDelegate old);

class InlineMultiChildLayoutDelegate<T> extends MultiChildLayoutDelegate {
  InlineMultiChildLayoutDelegate._(
    this.performLayoutDelegate,
    this.shouldRelayoutDelegate,
    this.config,
  );

  factory InlineMultiChildLayoutDelegate({
    required InlinePerformLayout performLayout,
    InlineShouldRelayout? shouldRelayout,
    required T config,
  }) {
    shouldRelayout ??= (old) => old.config != config;
    return InlineMultiChildLayoutDelegate._(performLayout, shouldRelayout, config);
  }

  final InlinePerformLayout performLayoutDelegate;
  final InlineShouldRelayout shouldRelayoutDelegate;
  final T config;

  @override
  void performLayout(Size size) => performLayoutDelegate(size, this);

  @override
  bool shouldRelayout(InlineMultiChildLayoutDelegate oldDelegate) =>
      shouldRelayoutDelegate(oldDelegate);
}
