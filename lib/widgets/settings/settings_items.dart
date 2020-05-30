import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/pinger_bottom_sheet.dart';

const double _SWITCH_WIDTH = 60.0;

class SettingsHeaderItem extends StatelessWidget {
  final String title;

  const SettingsHeaderItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PingSettingItem extends StatelessWidget {
  final String label;
  final String unit;
  final int value;
  final ValueChanged<int> onChanged;

  const PingSettingItem({
    Key key,
    @required this.label,
    @required this.unit,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Text(label, style: TextStyle(fontSize: 18.0)),
      Spacer(),
      InkWell(
        onTap: () async {
          final result = await _showEditSheet(context, label, unit, value);
          if (result != null && result != value) onChanged(result);
        },
        child: Container(
          constraints: BoxConstraints(minWidth: _SWITCH_WIDTH),
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 6.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                value.toString(),
                style: TextStyle(fontSize: 18.0, color: R.colors.secondary),
              ),
              Container(width: 4.0),
              Text(
                unit,
                style: TextStyle(fontSize: 18.0, color: R.colors.gray),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Future<int> _showEditSheet(
      BuildContext context, String label, String unit, int value) {
    final controller = TextEditingController.fromValue(TextEditingValue(
      text: value.toString(),
      selection: TextSelection(
        baseOffset: 0,
        extentOffset: value.toString().length,
      ),
    ));
    return PingerBottomSheet.show<int>(
      context,
      title: label,
      subtitle: "Provide new value",
      rejectLabel: "CANCEL",
      onRejectPressed: Navigator.of(context).pop,
      onAcceptPressed: () {
        final result = int.tryParse(controller.text);
        Navigator.of(context).pop(result);
      },
      canAccept: () => controller.text.isNotEmpty,
      builder: (rebuild) => _buildEditContent(context, rebuild, controller),
    );
  }

  Widget _buildEditContent(BuildContext context, VoidCallback rebuild,
      TextEditingController controller) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
        width: 24.0 + controller.text.length * 14.0,
        child: TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: R.styles.textFieldText.copyWith(fontSize: 24.0),
          maxLines: 1,
          maxLength: 3,
          controller: controller,
          decoration: InputDecoration(
            counter: SizedBox.shrink(),
            contentPadding: EdgeInsets.zero,
            suffixText: unit,
          ),
          inputFormatters: [
            WhitelistingTextInputFormatter(RegExp(r"[1-9]\d{0,2}")),
          ],
          onChanged: (_) => rebuild(),
        ),
      ),
    );
  }
}

class SwitchSettingItem extends StatelessWidget {
  final String label;
  final String description;
  final bool enabled;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchSettingItem({
    Key key,
    @required this.label,
    this.description,
    this.enabled = true,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Text(label, style: TextStyle(fontSize: 18.0)),
              Spacer(),
              Container(
                height: 40.0,
                alignment: Alignment.centerRight,
                child: Switch(value: value, onChanged: onChanged),
              ),
            ]),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(right: _SWITCH_WIDTH + 8.0),
                child: Text(
                  description,
                  style: TextStyle(color: R.colors.gray),
                ),
              ),
          ],
        ),
      ),
      if (!enabled)
        Positioned.fill(
          child: AbsorbPointer(
            child: Container(
              color: R.colors.canvas.withOpacity(0.75),
            ),
          ),
        ),
    ]);
  }
}
