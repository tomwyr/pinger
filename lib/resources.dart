import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

// Static getters ensure that resources are recreated on hot reload

class R {
  R._();

  static PingerColors get colors => PingerColors();
  static PingerDimens get dimens => PingerDimens();
  static PingerThemes get themes => PingerThemes();
  static PingerStyles get styles => PingerStyles();
}

class PingerColors {
  const PingerColors();

  final primaryDark = const Color(0xFF2F2E41);
  final primary = const Color(0xFF3F3D56);
  final primaryLight = const Color(0xFF575A89);
  final secondary = const Color(0xFFEE6C4D);
  final accent = const Color(0xFFFF6584);
  final grayDark = const Color(0xFF929292);
  final gray = const Color(0xFFC2C2C2);
  final grayLight = const Color(0xFFF2F2F2);

  final canvas = const Color(0xFFFFFFFF);
  final shadow = const Color(0x42000000);
  final none = const Color(0x00FFFFFF);

  final pingSuccessful = const Color(0xFF219653);
  final pingFailed = const Color(0xFFEB5757);
  final pingTotal = const Color(0xFF2F80ED);
  final pingMin = const Color(0xFF219653);
  final pingMean = const Color(0xFFF2C94C);
  final pingMax = const Color(0xFFEB5757);
}

class PingerDimens {
  const PingerDimens();
}

class PingerThemes {
  final app = ThemeData(
    fontFamily: GoogleFonts.roboto().fontFamily,
    canvasColor: R.colors.canvas,
    cursorColor: R.colors.secondary,
    textSelectionColor: R.colors.primaryLight.withOpacity(0.5),
    textSelectionHandleColor: R.colors.primaryLight,
    primaryColor: R.colors.secondary,
    accentColor: R.colors.secondary,
    hintColor: R.colors.gray,
    textTheme: _textTheme,
    buttonTheme: _buttonTheme,
    appBarTheme: _appbarTheme,
  );

  final raisedButton = _buttonTheme.copyWith(minWidth: 216.0);
  final flatButton = _buttonTheme.copyWith(
    colorScheme: ColorScheme.light(primary: R.colors.gray),
  );

  static ButtonThemeData get _buttonTheme => ButtonThemeData(
        height: 48.0,
        buttonColor: R.colors.secondary,
        colorScheme: ColorScheme.light(primary: R.colors.primary),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      );

  static AppBarTheme get _appbarTheme => AppBarTheme(
        elevation: 0.0,
        color: R.colors.canvas,
        iconTheme: IconThemeData(color: R.colors.primaryLight),
        textTheme: TextTheme(
          headline6: GoogleFonts.orbitron(
            color: R.colors.secondary,
            fontSize: 24.0,
          ),
        ),
      );

  static TextTheme get _textTheme => TextTheme(
        bodyText2: TextStyle(),
        button: TextStyle(fontSize: 18.0),
        subtitle1: TextStyle(color: R.colors.primary),
      ).apply(
        bodyColor: R.colors.primary,
        displayColor: R.colors.primary,
      );
}

class PingerStyles {
  // Theme references
  TextStyle get textFieldText => R.themes.app.textTheme.subtitle1;
  TextStyle get appBarTitle => R.themes.app.appBarTheme.textTheme.headline6;
  TextStyle get text => R.themes.app.textTheme.bodyText2;

  // Common styles
  TextStyle get chartLabel => TextStyle(fontSize: 12.0, color: R.colors.gray);
  BorderSide get outlineButtonBorder =>
      BorderSide(color: R.colors.grayLight, width: 1.5);
}
