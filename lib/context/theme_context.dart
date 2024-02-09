import "package:flutter/material.dart" show ChangeNotifier, ThemeMode;

class ThemeContext extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  setTheme(ThemeMode newTheme) {
    _themeMode = newTheme;
    notifyListeners();
  }

  ThemeMode get themeMode => _themeMode;
}