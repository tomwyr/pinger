import 'package:flutter/material.dart';

typedef SwitchButtonsBuilder = Widget Function(
  BuildContext context,
  List<bool> isSelected,
  ValueChanged<int> onPressed,
);

class SwitchToggleButtons<T> extends StatefulWidget {
  final SwitchButtonsBuilder builder;
  final List<T> values;
  final T selection;
  final ValueChanged<T> onChanged;

  const SwitchToggleButtons({
    Key key,
    @required this.values,
    @required this.selection,
    @required this.onChanged,
    @required this.builder,
  }) : super(key: key);

  @override
  State createState() => _SwitchToggleButtonsState<T>();
}

class _SwitchToggleButtonsState<T> extends State<SwitchToggleButtons<T>> {
  List<bool> _isSelected;

  @override
  void didUpdateWidget(SwitchToggleButtons<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selection != oldWidget.selection ||
        widget.values != oldWidget.values) {
      _updateSelected();
    }
  }

  @override
  void initState() {
    super.initState();
    _updateSelected();
  }

  void _updateSelected() {
    _isSelected = List.filled(widget.values.length, false);
    if (widget.selection != null) {
      final selectionIndex = widget.values.indexOf(widget.selection);
      _isSelected[selectionIndex] = true;
    }
  }

  void _onPressed(int index) {
    final value = widget.values[index];
    if (value != widget.selection) widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, _isSelected, _onPressed);
}
