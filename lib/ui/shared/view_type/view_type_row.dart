import 'package:flutter/material.dart';
import 'package:pinger/ui/shared/view_type/view_type_button.dart';

class ViewTypeRow<T> extends StatelessWidget {
  final Map<T, String> types;
  final T selection;
  final ValueChanged<T> onChanged;

  const ViewTypeRow({
    Key key,
    @required this.types,
    @required this.selection,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final buttonWidth = constraints.maxWidth / types.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: types.entries
              .map((it) => _buildViewTypeButton(it.key, buttonWidth))
              .toList(),
        );
      },
    );
  }

  Widget _buildViewTypeButton(T type, double maxWidth) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ViewTypeButton(
          label: types[type],
          selected: selection == type,
          onPressed: () {
            if (selection != type) onChanged(type);
          },
        ),
      ),
    );
  }
}
