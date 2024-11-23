import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int counter = 0;
  int index = 0;
  double angle = 0;

  List<String> Azkar = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
  ];

  void thecounter() {
    if (counter < 33) {
      counter++;
    } else {
      counter = 0;
      index++;
      if (index == Azkar.length) {
        index = 0;
      }
    }

    angle += 15;

    notifyListeners();
  }
}