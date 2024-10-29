import 'package:flutter/material.dart';

class SelectedItem extends StatelessWidget {
  String title;
  SelectedItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodySmall,),

        Icon(Icons.check,color: Theme.of(context).colorScheme.tertiary,size: 32,)
      ],
    );
  }
}
