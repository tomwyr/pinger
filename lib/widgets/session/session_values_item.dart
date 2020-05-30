import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class SessionValuesItem extends StatelessWidget {
  static final double indicatorSize = 32.0;
  static final double indicatorBoxWidth = 64.0;
  static final double linkHeight = 12.0;
  static final double extent = indicatorSize + linkHeight;

  final int index;
  final int result;
  final int delta;
  final bool showLink;

  const SessionValuesItem._({
    Key key,
    @required this.index,
    @required this.result,
    @required this.delta,
    @required this.showLink,
  }) : super(key: key);

  factory SessionValuesItem.reversed({
    Key key,
    @required List<int> values,
    @required int index,
  }) {
    final reversedIndex = values.length - index - 1;
    final result = values[reversedIndex];
    final prevResult = values.reversed
        .skip(index + 1)
        .firstWhere((it) => it != null, orElse: () => null);
    final delta =
        result != null && prevResult != null ? result - prevResult : null;
    return SessionValuesItem._(
      key: key,
      index: reversedIndex + 1,
      result: result,
      delta: delta,
      showLink: index != 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLink) _buildLink(),
        Row(children: [
          _buildIndicator(),
          _buildValue(),
          _buildDelta(),
        ]),
      ],
    );
  }

  Widget _buildIndicator() {
    return SizedBox(
      width: indicatorBoxWidth,
      child: Center(
        child: SizedBox.fromSize(
          size: Size.square(indicatorSize),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(color: R.colors.primaryLight, width: 2.0),
            ),
            child: Center(
              child: Text(
                "$index",
                style: TextStyle(color: R.colors.secondary),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValue() {
    return Expanded(
      child: Text(
        result != null ? "$result ms" : "-",
        style: TextStyle(fontSize: 18.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDelta() {
    return SizedBox(
      width: indicatorBoxWidth,
      child: Text(
        (delta != null && delta != 0) ? delta > 0 ? "+$delta" : "$delta" : "-",
        style: TextStyle(color: R.colors.gray),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLink() {
    return SizedBox(
      width: indicatorBoxWidth,
      height: linkHeight,
      child: Center(
        child: Container(
          width: 2.0,
          color: R.colors.primaryLight,
        ),
      ),
    );
  }
}
