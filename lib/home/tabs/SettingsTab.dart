import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/ThemeBottomSheet.dart';

import 'LanguageBottomSheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Language",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) =>LanguageBottomSheet(),);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:Theme.of(context).colorScheme.tertiary,
                  width: 2
                )
              ),
              child: Text("English",style: TextStyle(
                  fontSize: 20
              )),
            ),
          ),
          SizedBox(height: 20,),
          Text("Theme",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: 2
                  )
              ),
              child: Text("Light",style: TextStyle(
                  fontSize: 20
              )),
            ),
          )
        ],
      ),
    );
  }
}
