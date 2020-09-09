import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';
import 'package:pinger/utils/format_utils.dart';

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
  final NumSetting value;
  final ValueChanged<NumSetting> onChanged;
  final bool allowInfinite;

  const PingSettingItem({
    Key key,
    @required this.label,
    @required this.unit,
    @required this.value,
    @required this.onChanged,
    this.allowInfinite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Text(label, style: TextStyle(fontSize: 18.0)),
      Spacer(),
      InkWell(
        onTap: () async {
          final result = await SettingItemSheet.show(
            value: value,
            label: label,
            unit: unit,
            allowInfinite: allowInfinite,
          );
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
              Flexible(
                child: Text(
                  FormatUtils.getCountLabel(value),
                  style: TextStyle(fontSize: 18.0, color: R.colors.secondary),
                ),
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
}

class SettingItemSheet extends StatefulWidget {
  static const _digitsRegExp = r"[1-9]\d{0,2})";

  final String unit;
  final bool allowInfinite;
  final NumSetting value;
  final ValueChanged<NumSetting> onValueChanged;

  const SettingItemSheet({
    Key key,
    @required this.unit,
    @required this.allowInfinite,
    @required this.value,
    @required this.onValueChanged,
  }) : super(key: key);

  static Future<NumSetting> show({
    @required NumSetting value,
    @required String label,
    @required String unit,
    @required bool allowInfinite,
  }) {
    var currentValue = value;
    return PingerBottomSheet.show<NumSetting>(
      title: Text(label, style: R.styles.bottomSheetTitle),
      subtitle: Text(
        S.current.settingSheetTitle,
        style: R.styles.bottomSheetSubtitle,
      ),
      rejectLabel: S.current.cancelButtonLabel,
      onAcceptPressed: () => PingerApp.router.pop(currentValue),
      canAccept: () => currentValue != null,
      builder: (rebuild) => SettingItemSheet(
        unit: unit,
        allowInfinite: allowInfinite,
        value: value,
        onValueChanged: (it) {
          currentValue = it;
          rebuild();
        },
      ),
    );
  }

  @override
  _SettingItemSheetState createState() => _SettingItemSheetState();
}

class _SettingItemSheetState extends State<SettingItemSheet> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final text = FormatUtils.getCountLabel(widget.value);
    _controller = TextEditingController.fromValue(TextEditingValue(
      text: text,
      selection: TextSelection(baseOffset: 0, extentOffset: text.length),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingValue _getNewInputValue(
      int pressIndex, bool isInfinite, String currentText) {
    if (pressIndex == 0) {
      if (isInfinite) {
        return TextEditingValue.empty;
      } else {
        return TextEditingValue(
          text: currentText,
          selection: TextSelection(
            baseOffset: 0,
            extentOffset: currentText.length,
          ),
        );
      }
    } else if (pressIndex == 1) {
      return TextEditingValue(
        text: R.symbols.infty,
        selection: TextSelection(baseOffset: 0, extentOffset: 1),
      );
    }
    return null;
  }

  void _onInputChanged(String text) {
    final value = text == R.symbols.infty
        ? NumSetting.infinite()
        : text.isNotEmpty ? NumSetting.finite(int.tryParse(text)) : null;
    widget.onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _controller,
        builder: (_, value, child) => Column(children: [
          Container(height: 24.0),
          if (widget.allowInfinite)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildToggleButtons(value.text),
            ),
          child,
          Container(height: 4.0),
        ]),
        child: Container(
          width: 24.0 + _controller.text.length * 14.0,
          child: _buildValueInput(),
        ),
      ),
    );
  }

  Widget _buildToggleButtons(String text) {
    final isInfinite = text == R.symbols.infty;
    return ToggleButtons(
      children: [Icon(Icons.edit, size: 12.0), Text(R.symbols.infty)],
      isSelected: [!isInfinite, isInfinite],
      onPressed: (index) {
        final text = _controller.text;
        final newValue = _getNewInputValue(index, isInfinite, text);
        if (newValue != null) {
          _controller.value = newValue;
          if (newValue.text != text) _onInputChanged(newValue.text);
        }
      },
    );
  }

  Widget _buildValueInput() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: R.styles.textFieldText.copyWith(fontSize: 24.0),
      maxLines: 1,
      maxLength: 3,
      controller: _controller,
      decoration: InputDecoration(
        counter: SizedBox.shrink(),
        contentPadding: EdgeInsets.zero,
        suffixText: widget.unit,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp("(${R.symbols.infty}|${SettingItemSheet._digitsRegExp}"),
        ),
      ],
      onChanged: _onInputChanged,
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
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(label, style: TextStyle(fontSize: 18.0)),
                  ),
                  if (description != null)
                    Text(
                      description,
                      style: TextStyle(color: R.colors.gray),
                    ),
                ],
              ),
            ),
            Container(
              height: 36.0,
              alignment: Alignment.topRight,
              child: Switch(value: value, onChanged: onChanged),
            ),
          ],
        ),
      ),
      if (!enabled)
        TweenAnimationBuilder(
          duration: kThemeChangeDuration,
          tween: ColorTween(begin: null, end: R.colors.canvas),
          builder: (_, value, __) => Positioned.fill(
            child: AbsorbPointer(
              child: Container(color: value.withOpacity(0.75)),
            ),
          ),
        ),
    ]);
  }
}
