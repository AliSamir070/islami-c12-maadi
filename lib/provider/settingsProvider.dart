import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;


  void changeThemeMode(ThemeMode newTheme)async {
    if (newTheme == themeMode) return;
    themeMode = newTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', newTheme == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }
  String language = "en";
  void changeLanguage (String newLanguage)async {
    if (newLanguage == language) return;
    language = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', newLanguage);
    notifyListeners();
  }
}