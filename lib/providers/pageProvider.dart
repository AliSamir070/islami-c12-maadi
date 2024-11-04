import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProvider extends ChangeNotifier{
  int lastpage = 5;
  PageProvider(){
  getPage();
  }
  changePage(int index){
    lastpage = index;
    setPage(index);
    notifyListeners();
  }
  setPage(int index)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("lastPage", index);
  }
  getPage()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    lastpage = prefs.getInt("lastPage")??0;
    notifyListeners();
  }
}