import 'package:flutter/material.dart';

class Tasbehbtn extends StatelessWidget {
  String tasbeh;
  Function onclick;
  // ignore: use_key_in_widget_constructors
  Tasbehbtn({required this.tasbeh, required this.onclick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 183, 147, 95),
          ),
          onPressed: () {
            onclick();
          },
          child: Text(
            tasbeh,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
