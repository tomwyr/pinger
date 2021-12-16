import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final R = PingerResources._();

class PingerResources {
  PingerResources._();

  late PingerColors _colors;
  late PingerDimens _dimens;
  late PingerThemes _themes;
  late PingerStyles _styles;
  late PingerSymbols _symbols;

  PingerColors get colors => _colors;
  PingerDimens get dimens => _dimens;
  PingerThemes get themes => _themes;
  PingerStyles get styles => _styles;
  PingerSymbols get symbols => _symbols;

  void load(Brightness brightness) {
    _dimens = const PingerDimens();
    _styles = PingerStyles();
    _symbols = PingerSymbols();
    if (brightness == Brightness.dark) {
      _colors = PingerDarkColors();
      _themes = PingerDarkThemes();
    } else {
      _colors = PingerLightColors();
      _themes = PingerLightThemes();
    }
  }
}

abstract class PingerColors {
  PingerColors._();

  final primary = const Color(0xFF3F3D56);
  final primaryLight = const Color(0xFF575A89);
  final secondary = const Color(0xFFEE6C4D);
  final accent = const Color(0xFFFF6584);
  final gray = const Color(0xFFC2C2C2);
  final grayLight = const Color(0xFFF2F2F2);

  final canvas = const Color(0xFFFFFFFF);
  final shadow = const Color(0x42000000);
  final none = const Color(0x00FFFFFF);
  final white = const Color(0xFFFFFFFF);

  final pingSuccessful = const Color(0xFF219653);
  final pingFailed = const Color(0xFFEB5757);
  final pingTotal = const Color(0xFF2F80ED);
  final pingMin = const Color(0xFF219653);
  final pingMean = const Color(0xFFF2C94C);
  final pingMax = const Color(0xFFEB5757);
}

class PingerLightColors extends PingerColors {
  PingerLightColors() : super._();
}

class PingerDarkColors extends PingerColors {
  PingerDarkColors() : super._();

  @override
  Color get primary => const Color(0xFFDEDEDE);
  @override
  Color get primaryLight => const Color(0xFF4B4d75);
  @override
  Color get gray => const Color(0xFF757575);
  @override
  Color get grayLight => const Color(0xFF404040);

  @override
  Color get canvas => const Color(0xFF333333);
  @override
  Color get shadow => const Color(0x22FFFFFF);
  @override
  Color get none => const Color(0x00000000);
}

class PingerDimens {
  const PingerDimens();

  final buttonSplashOpacity = 0.15;
  final buttonThemeRadius = 12.0;
  final elevatedButtonMinWidth = 216.0;
  final elevatedButtonMinHeight = kMinInteractiveDimension;
}

abstract class PingerThemes {
  final mode = ThemeMode.light;

  final app = _appTheme.copyWith(primaryColorBrightness: Brightness.light);

  static ThemeData get _appTheme => ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        canvasColor: R.colors.canvas,
        primaryColor: R.colors.secondary,
        hintColor: R.colors.gray,
        toggleableActiveColor: R.colors.secondary,
        colorScheme: _colorScheme,
        textTheme: _textTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        textButtonTheme: _textButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        appBarTheme: _appBarTheme,
        toggleButtonsTheme: _toggleButtonsTheme,
        textSelectionTheme: _textSelectionTheme,
      );

  static ColorScheme get _colorScheme => ColorScheme.light(
        primary: R.colors.secondary,
      );

  static TextTheme get _textTheme => TextTheme(
        bodyText2: const TextStyle(),
        button: const TextStyle(fontSize: 18.0),
        subtitle1: TextStyle(color: R.colors.primary),
      ).apply(
        bodyColor: R.colors.primary,
        displayColor: R.colors.primary,
      );

  static ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(R.dimens.elevatedButtonMinWidth, R.dimens.elevatedButtonMinHeight),
          primary: R.colors.secondary,
          shape: _buttonShape,
        ).copyWith(
          overlayColor: MaterialStateProperty.all(
            R.colors.secondary.withOpacity(R.dimens.buttonSplashOpacity),
          ),
        ),
      );

  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: R.colors.secondary,
          shape: _buttonShape,
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: R.colors.primary,
          shape: _buttonShape,
        ).copyWith(
          overlayColor: MaterialStateProperty.all(
            R.colors.secondary.withOpacity(R.dimens.buttonSplashOpacity),
          ),
        ),
      );

  static OutlinedBorder get _buttonShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(R.dimens.buttonThemeRadius),
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        elevation: 0.0,
        color: R.colors.canvas,
        iconTheme: IconThemeData(color: R.colors.primaryLight),
        titleTextStyle: GoogleFonts.orbitron(
          color: R.colors.secondary,
          fontSize: 24.0,
        ),
      );

  static ToggleButtonsThemeData get _toggleButtonsTheme => ToggleButtonsThemeData(
        selectedColor: R.colors.secondary,
        fillColor: R.colors.secondary.withOpacity(0.25),
        splashColor: R.colors.primaryLight.withOpacity(0.5),
        selectedBorderColor: R.colors.secondary,
        borderRadius: BorderRadius.circular(R.dimens.buttonThemeRadius),
      );

  static TextSelectionThemeData get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: R.colors.secondary,
        selectionColor: R.colors.primaryLight.withOpacity(0.5),
        selectionHandleColor: R.colors.primaryLight,
      );
}

class PingerLightThemes extends PingerThemes {}

class PingerDarkThemes extends PingerThemes {
  @override
  ThemeMode get mode => ThemeMode.dark;

  @override
  ThemeData get app => PingerThemes._appTheme.copyWith(
        primaryColorBrightness: Brightness.dark,
      );
}

class PingerStyles {
  // Theme references
  TextStyle? get textFieldText => R.themes.app.textTheme.subtitle1;
  TextStyle? get appBarTitle => R.themes.app.appBarTheme.toolbarTextStyle;
  TextStyle? get text => R.themes.app.textTheme.bodyText2;

  // Common styles
  TextStyle get chartLabel => TextStyle(fontSize: 12.0, color: R.colors.gray);
  TextStyle get bottomSheetTitle => const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  TextStyle get bottomSheetSubtitle => TextStyle(fontSize: 18.0, color: R.colors.gray);
  BorderSide get outlineButtonBorder => BorderSide(color: R.colors.grayLight, width: 1.5);
}

class PingerSymbols {
  String get infinity => "∞";
}
