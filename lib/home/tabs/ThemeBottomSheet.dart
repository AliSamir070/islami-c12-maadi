import 'package:flutter/material.dart';

import 'SelectedItem.dart';
import 'UnselectedItem.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedItem("Light"),
          SizedBox(height: 20,),
          UnselectedItem("Dark")
        ],
      ),
    );
  }
}
