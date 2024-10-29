import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c12_maadi/quran_details/VerseWidget.dart';

import '../style/AppStyle.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = "qurandetails";

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context){
    QuranDetailsArgs args = ModalRoute.of(context)?.settings.arguments as QuranDetailsArgs;
    loadFile(args.index);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppStyle.isDark
              ?"assets/images/home_dark_background.png"
              : "assets/images/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name),
        ),
      body: Card(
        child: lines.isEmpty
            ?Center(child: CircularProgressIndicator(),)
            :Column(
              children: [
                Expanded(
                  child: ListView.separated(
                  itemBuilder: (context, index) =>VerseWidget(
                    verse: lines[index],
                    verseNumber: index+1,
                  ) ,
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: lines.length),
                ),
              ],
            ),
      ),
      ),
    );
  }

  add(int n1,int n2){
    return n1+n2;
  }

  List<String>lines = [];

  loadFile(int index)async{
    String fileContent = await rootBundle.loadString("assets/files/${index+1}.txt"); //non-blocking
    lines = fileContent.split("\n");
    setState(() {

    });
  }
}
class QuranDetailsArgs{
  String name;
  int index;
  QuranDetailsArgs({required this.name , required this.index});
}
