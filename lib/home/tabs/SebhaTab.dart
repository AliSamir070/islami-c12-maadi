import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/providers/sebha_provider.dart';
import 'package:islami_c12_maadi/providers/sebha_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/SettingsProvider.dart';
import '../../providers/sebha_provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return  ChangeNotifierProvider(
      create: (context) => SebhaProvider() ,
      child: Consumer<SebhaProvider>(
        builder: (context , value , child){
          return  Center(

            child:Column (
              children:[
                Stack(
                  alignment: Alignment.topCenter,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: width * 0.10),
                      child: Image.asset(
                          settingsProvider.themeMode == ThemeMode.light?
                          'assets/images/head_of_seb7a.png'
                              :'assets/images/head_of_seb7a_dark.png' ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: height * 0.037),
                      child: GestureDetector(
                        onTap:value.onZkrClicked ,
                        child: Transform.rotate(
                          angle:value.angle,
                          child: Image.asset(
                              settingsProvider.themeMode == ThemeMode.light?
                              'assets/images/body_of_seb7a.png'
                                  :'assets/images/body_of_seb7a_dark.png',
                              height: height * 0.35),
                        ),
                      ),
                    ),
                  ],
                ),settingsProvider.themeMode == ThemeMode.dark?
                SizedBox(height: height * 0.001): SizedBox(height: height * 0),
                Text('3add El Tassbehatt',
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: height * 0.04),
                Container(
                    width: width * 0.18,
                    height: height *0.1,


                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.57),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Center(
                      child: Text(value.counter.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 25,
                        ),
                      ),
                    )
                ),
                SizedBox(height: height *0.04 ),
                ElevatedButton(onPressed:value.onZkrClicked ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    maximumSize: Size( width *0.5,  height *0.05),
                    minimumSize: Size( width *0.5,  height *0.05),
                  ),
                  child: Text(value.azkar[value.index] ,
                      style: Theme.of(context).textTheme.titleLarge),
                )
              ],
            ),
          );
        },

      ),
    );

  }
}