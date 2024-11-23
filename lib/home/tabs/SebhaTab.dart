import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/providers/sebha_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/SettingsProvider.dart';

class SebhaTab extends StatelessWidget {


  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return ChangeNotifierProvider(
      create: (context) => SebhaProvider(),
      child: Consumer2<SebhaProvider, SettingsProvider>(
        builder: (context, sebhaProvider, settingsProvider, child) {
          return Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: Image.asset(
                        settingsProvider.themeMode == ThemeMode.light
                            ? 'assets/images/head_sebha_logo.png'
                            : 'assets/images/head_sebha_dark.png',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.042),
                      child: GestureDetector(
                        onTap: sebhaProvider.thecounter,
                        child: Transform.rotate(
                          angle: sebhaProvider.angle,
                          child: Image.asset(
                            settingsProvider.themeMode == ThemeMode.light
                                ? 'assets/images/body_sebha_logo.png'
                                : 'assets/images/body_sebha_dark.png',
                            height: height * 0.36,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'عدد التسبيحات',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: height * 0.04),
                Container(
                  width: width * 0.18,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    color:
                    Theme.of(context).colorScheme.primary.withOpacity(0.57),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Center(
                    child: Text(
                      sebhaProvider.counter.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                ElevatedButton(
                  onPressed: sebhaProvider.thecounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    maximumSize: Size(width * 0.4, height * 0.06),
                    minimumSize: Size(width * 0.4, height * 0.06),
                  ),
                  child: Text(
                    sebhaProvider.Azkar[sebhaProvider.index],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );



  }
}
