import 'package:finish_task_part1/generated/l10n.dart';
import 'package:flutter/material.dart';

class ThemeAndLanguageService with ChangeNotifier {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }

  onChange(String value) async {
    if (value == 'ru_RU') {
      await S.load(
        const Locale('ru', 'RU'),
      );
    } else if (value == 'en') {
      await S.load(
        const Locale('en'),
      );
    }
    notifyListeners();
  }
}
