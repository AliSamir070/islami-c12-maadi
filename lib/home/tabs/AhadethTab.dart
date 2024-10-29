import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c12_maadi/ahadeth_details/ahadeth_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Hadeth.dart';

class AhadethTab extends StatefulWidget {

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {

  @override
  Widget build(BuildContext context) {
    return ahadethList.isEmpty
        ?Center(child: CircularProgressIndicator(),)
        :Column(
      children: [
        Expanded(child: Image.asset("assets/images/hadith_header.png")),
        Divider(),
        Text(AppLocalizations.of(context)!.ahadeth,style: Theme.of(context).textTheme.titleMedium,),
        Divider(),
        Expanded(
          flex: 2,
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  Navigator.pushNamed(context, AhadethDetailsScreen.routeName,arguments: ahadethList[index]);
                },
                child: Text(
                  ahadethList[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              separatorBuilder:(context, index) => Divider(),
              itemCount:ahadethList.length
          ),
        )
      ],
    );
  }

  List<Hadeth> ahadethList = [];

  readAhadethFile()async{
    String fileContent = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethFileData = fileContent.split("#");
    for(int i=0;i<ahadethFileData.length;i++){
      List<String> hadethLines = ahadethFileData[i].trim().split("\n");
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join(" ");
      ahadethList.add(Hadeth(hadethTitle, hadethContent));
    }
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    readAhadethFile();
  }
}
