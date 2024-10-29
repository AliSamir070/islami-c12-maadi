import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/quran_details/quran_details_screen.dart';

class QuranSuraWidget extends StatelessWidget {
  String name;
  int number;
  int index;
  QuranSuraWidget({required this.name,required this.number,required this.index});
// unversioned (untracked) - ignored - tracked
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(QuranDetailsScreen.routeName,

            arguments: QuranDetailsArgs(
              name: name,
              index: index
            ));
      },
      child: Row(
        children: [
          Expanded(child: Text(name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,)),
          Container(
            color: Theme.of(context).colorScheme.tertiary,
            height: 0.08*height,
            width: 3,
          ),
          Expanded(child: Text(number.toString(),textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400
          ),))
        ],
      ),
    );
  }
}
