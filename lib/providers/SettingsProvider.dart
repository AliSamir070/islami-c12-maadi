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
    gettheme();
    getlan();
  }
  changeTheme(ThemeMode newTheme) {
    if (newTheme == themeMode) return;
    themeMode = newTheme;
    savetheme(themeMode);
    notifyListeners();
  }

  String language = "en";

  changeLanguage(String newLanguage) {
    if (language == newLanguage) return;
    language = newLanguage;
    savelan(language);
    notifyListeners();
  }

  void savetheme(ThemeMode theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == ThemeMode.light) {
      prefs.setString('theme', 'light');
    } else {
      prefs.setString('theme', 'dark');
    }
  }

  void gettheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String cachedTheme = prefs.getString('theme') ?? 'light';
    if (cachedTheme == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void savelan(String lan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (lan == 'en') {
      prefs.setString('language', 'en');
    } else {
      prefs.setString('language', 'ar');
    }
  }

  void getlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String lan = prefs.getString('language') ?? 'en';

    if (lan == 'ar') {
      language = 'ar';
    } else {
      language = 'en';
    }

    notifyListeners();
  }
}
