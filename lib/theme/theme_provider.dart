import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ligtMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void smenitTheme() {
    if (_themeData == ligtMode) {
      themeData = darkMode;
    } else {
      themeData = ligtMode;
    }
  }
}
