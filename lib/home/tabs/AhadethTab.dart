import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c12_maadi/ahadeth_details/ahadeth_details_screen.dart';
import 'package:islami_c12_maadi/home/tabs/hadeth.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
@override
void initState(){
  super.initState();
  readAhadeth();
}
  @override

  Widget build(BuildContext context) {
    return ahadethList.isEmpty
        ?Center(child: CircularProgressIndicator(),)
    :Column(
      children: [
        Expanded(child: Image.asset("assets/images/ahadeth_image.png")),
        Divider(),
        Text("Ahadeth", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600
        ),),
        Divider(),
        Expanded(
          flex: 2,
          child: ListView.separated(itemBuilder: (context, index) =>
              InkWell(
                onTap:(){
                  Navigator.of(context).pushNamed(AhadethDetailsScreen.routeName,
                      arguments: ahadethList[index]);
                },
                child: Text(ahadethList[index].title,
                  textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                  ),),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: ahadethList.length),
        )

      ],
    );
  }

  List<Hadeth> ahadethList = [];

  readAhadeth() async {
    String fileContent = await rootBundle.loadString(
        "assets/files/ahadeth.txt");
    List<String> ahadethFileData = fileContent.split('#');
    for (int i = 0; i < ahadethFileData.length; i++) {
      List<String> hadethLines = ahadethFileData[i].trim().split('\n');
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join(' ');
      ahadethList.add(Hadeth(hadethTitle, hadethContent));
      setState(() {

      });
    }
  }
}
