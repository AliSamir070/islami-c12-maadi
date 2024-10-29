import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c12_maadi/home/tabs/SelectedItem.dart';
import 'package:islami_c12_maadi/home/tabs/UnselectedItem.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedItem("English"),
          SizedBox(height: 20,),
          UnselectedItem("العربية")
        ],
      ),
    );
  }
}
