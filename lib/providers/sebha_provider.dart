import 'package:flutter/cupertino.dart';

class SebhaProvider extends ChangeNotifier{

  int counter =  0;
  int index =0 ;
  double angle = 0 ;
  List<String> azkar = [
    'Elhamdullah',
    'sbhan Allah',
    'Allah akabr',
  ];

  void onZkrClicked(){
    if(counter <33 ){
      counter++;
    }else{
      counter =0 ;
      index++;
      if ( index == azkar.length) {
        index=0;
      }
    }
    angle +=15 ;


    notifyListeners();
  }


}