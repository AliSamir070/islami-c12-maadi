import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  String language = 'en';

  SettingsProvider(){
    getTheme();
    getLang();
  }
  changeTheme(ThemeMode newTheme){
    if(newTheme == themeMode) return;
    themeMode = newTheme;
    setTheme(themeMode);
    notifyListeners();
  }


  changeLanguage(String newLanguage){
    if(language == newLanguage) return;
    setLang(newLanguage);
    language = newLanguage;
    notifyListeners();
  }

  void setTheme(ThemeMode theme)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch(theme)
        {
      case ThemeMode.system:
        break;
      case ThemeMode.dark:
        await prefs.setString("Theme","Dark");
        break;
      case ThemeMode.light:
        await prefs.setString("Theme","Light");
        break;
        }
  }
  void setLang(String Lang)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Language",(Lang == "en")?Lang:"ar");
  }
  getTheme ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String thememode = prefs.getString("Theme")??"Light";
    themeMode =
      (thememode == "Light")?
      ThemeMode.light:
      ThemeMode.dark;
      notifyListeners();
  }
  void getLang ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("Language")??"en";
    if(lang == "en") {
    language = lang;
  }
    else{
      language = "ar";
    }
      notifyListeners();
  }

}