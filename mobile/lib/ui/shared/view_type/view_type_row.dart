import 'package:flutter/material.dart';
import 'package:pinger/ui/shared/view_type/view_type_button.dart';

class ViewTypeRow<T> extends StatelessWidget {
  const ViewTypeRow({
    super.key,
    required this.labeledTypes,
    required this.selection,
    required this.onChanged,
  });

  final Map<T, String> labeledTypes;
  final T selection;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final buttonWidth = constraints.maxWidth / labeledTypes.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:
              labeledTypes.entries.map((it) => _buildViewTypeButton(it.key, buttonWidth)).toList(),
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
          label: labeledTypes[type],
          selected: selection == type,
          onPressed: () {
            if (selection != type) onChanged(type);
          },
        ),
      ),
    );
  }
}
