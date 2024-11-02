import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// observable
// publisher

// observers
// listeners
// subscribers
class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  SettingsProvider() {
    getThemeMode();
    getLanguage();
  }

  changeTheme(ThemeMode newTheme) {
    if (newTheme == themeMode) return;
    themeMode = newTheme;
    saveThemeMode(themeMode);
    notifyListeners();
  }

  String language = "en";

  changeLanguage(String newLanguage) {
    if (language == newLanguage) return;
    language = newLanguage;
    saveLanguage(language);
    notifyListeners();
  }

  void saveLanguage(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (lang == 'en') {
      prefs.setString('language', 'en');
    } else {
      prefs.setString('language', 'ar');
    }
  }

  void getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String lang = prefs.getString('language') ?? 'en';

    if (lang == 'ar') {
      language = 'ar';
    } else {
      language = 'en';
    }

    notifyListeners();
  }

  void saveThemeMode(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (theme == ThemeMode.light) {
      prefs.setString('theme', 'light');
    } else {
      prefs.setString('theme', 'dark');
    }
  }

  void getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String cachedTheme = prefs.getString('theme') ?? 'light';

    if (cachedTheme == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
