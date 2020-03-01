import 'package:flutter/widgets.dart';

class ConstExtentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double extent;
  final WidgetBuilder builder;

  ConstExtentHeaderDelegate({@required this.extent, @required this.builder});

  @override
  Widget build(BuildContext context, _, __) =>
      SizedBox(height: extent, child: builder(context));

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(ConstExtentHeaderDelegate old) => extent != old.extent;
}
