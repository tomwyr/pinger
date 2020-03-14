import 'package:flutter/material.dart';

class SessionResultsItem extends StatelessWidget {
  static const LINK_HEIGHT = 8.0;

  final int index;
  final int result;
  final int delta;
  final int resultsCount;

  const SessionResultsItem({
    Key key,
    @required this.index,
    @required this.result,
    @required this.delta,
    @required this.resultsCount,
  }) : super(key: key);

  factory SessionResultsItem.valueAt({
    Key key,
    @required List<double> values,
    @required int index,
  }) {
    final result = values[index]?.round();
    final prevResult = values.reversed
        .skip(values.length - index)
        .firstWhere((it) => it != null, orElse: () => null)
        ?.round();
    final delta =
        result != null && prevResult != null ? result - prevResult : null;
    return SessionResultsItem(
      key: key,
      index: index,
      result: result,
      delta: delta,
      resultsCount: values.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        SizedBox(
          width: 64.0,
          child: _buildIndexIndicator(index),
        ),
        Expanded(
          child: Text(
            result != null ? "$result ms" : "-",
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 64.0,
          child: index == resultsCount - 1
              ? Container()
              : Text(
                  (delta != null && delta != 0)
                      ? delta > 0 ? "+$delta" : "$delta"
                      : "-",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
        )
      ]),
    );
  }

  Widget _buildIndexIndicator(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildIndicatorLink(index != 0),
        Container(
          height: 32.0,
          width: 32.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color: Colors.lightBlue, width: 2.0),
          ),
          child: Center(child: Text("${resultsCount - index}")),
        ),
        _buildIndicatorLink(index != resultsCount - 1),
      ],
    );
  }

  Widget _buildIndicatorLink(bool visible) {
    return Container(
      height: LINK_HEIGHT,
      width: visible ? 2.0 : 0.0,
      color: Colors.lightBlue,
    );
  }
}
