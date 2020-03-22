import 'package:flutter/material.dart';

class SeparatedSliverList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;

  const SeparatedSliverList({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.separatorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final builder = !index.isEven ? separatorBuilder : itemBuilder;
          return builder(context, index ~/ 2);
        },
        semanticIndexCallback: (_, localIndex) =>
            localIndex.isEven ? localIndex ~/ 2 : null,
        childCount: itemCount > 0 ? (2 * itemCount - 1) : 0,
      ),
    );
  }
}
