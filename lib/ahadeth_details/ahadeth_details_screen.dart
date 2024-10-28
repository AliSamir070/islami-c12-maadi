import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/hadeth.dart';

class AhadethDetailsScreen extends StatelessWidget {
  static const String routeName = "Ahadeth";
  const AhadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container( decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background.png"),fit: BoxFit.fill)
    ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Expanded(
          child: Card(
            child:SingleChildScrollView(
              child: Text(args.content, style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400
              ),),
            ),
          ),
        ),

      ),
    );
  }
}
