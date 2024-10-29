import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/AhadethTab.dart';
import 'package:islami_c12_maadi/home/tabs/QuranTab.dart';
import 'package:islami_c12_maadi/home/tabs/RadioTab.dart';
import 'package:islami_c12_maadi/home/tabs/SebhaTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c12_maadi/home/tabs/SettingsTab.dart';
import 'package:islami_c12_maadi/style/AppStyle.dart';
// this is home
class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
            AppStyle.isDark
                ?"assets/images/home_dark_background.png"
                : "assets/images/background.png"
        ),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              setState(() {
                currentIndex = index;
              });
            },
            items:[
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                AssetImage("assets/images/moshaf_blue.png")
              ),label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,

                  icon: ImageIcon(
                  AssetImage("assets/images/ahadeth_icon.png")
              ),label: AppLocalizations.of(context)!.ahadeth),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,

                  icon: ImageIcon(
                  AssetImage("assets/images/sebha_icon.png")
              ),label: AppLocalizations.of(context)!.tasbeeh),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,

                  icon: ImageIcon(
                  AssetImage("assets/images/radio_icon.png")
              ),label: AppLocalizations.of(context)!.radio),
        BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,

                  icon: Icon(
                    Icons.settings
                  ),label: "Settings")
            ]
        ),
        body: tabs[currentIndex],
      ),
    );
  }
}
