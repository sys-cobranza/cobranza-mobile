import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvide with ChangeNotifier {
  static const DEFAULT_THEME_INDEX = 0;
  int _themeIndex = DEFAULT_THEME_INDEX;

  int get themeIndex => _themeIndex;

  ThemeData _themeData = ThemeData(
    primarySwatch: Colors.primaries[DEFAULT_THEME_INDEX],
    cursorColor: Colors.primaries[DEFAULT_THEME_INDEX],
  );

  ThemeData get themeData => _themeData;

  SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.primaries[DEFAULT_THEME_INDEX],
    systemNavigationBarColor: Colors.primaries[DEFAULT_THEME_INDEX],
    statusBarIconBrightness:
        _getReverseBrightness(Colors.primaries[DEFAULT_THEME_INDEX]),
    statusBarBrightness: ThemeData.estimateBrightnessForColor(
        Colors.primaries[DEFAULT_THEME_INDEX]),
    systemNavigationBarIconBrightness:
        _getReverseBrightness(Colors.primaries[DEFAULT_THEME_INDEX]),
  );

  SystemUiOverlayStyle get overlayStyle => _overlayStyle;

  static Brightness _getReverseBrightness(materialColor) {
    var reverseBrightness = ThemeData.estimateBrightnessForColor(materialColor);
    return reverseBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
  }

  void changeTheme(int themeIndex) {
    if (themeIndex >= 0 && themeIndex < Colors.primaries.length) {
      this._themeIndex = themeIndex;
      this._themeData = ThemeData(
        primarySwatch: Colors.primaries[themeIndex],
        cursorColor: Colors.primaries[themeIndex],
      );
      _overlayStyle = SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.primaries[themeIndex],
        systemNavigationBarColor: Colors.primaries[themeIndex],
        statusBarIconBrightness:
            _getReverseBrightness(Colors.primaries[themeIndex]),
        statusBarBrightness:
            ThemeData.estimateBrightnessForColor(Colors.primaries[themeIndex]),
        systemNavigationBarIconBrightness:
            _getReverseBrightness(Colors.primaries[themeIndex]),
      );
      notifyListeners();
    }
  }
}
