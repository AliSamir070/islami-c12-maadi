import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/AhadethTab.dart';
import 'package:islami_c12_maadi/home/tabs/QuranTab.dart';
import 'package:islami_c12_maadi/home/tabs/RadioTab.dart';
import 'package:islami_c12_maadi/home/tabs/SebhaTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c12_maadi/home/tabs/SettingsTab.dart';
import 'package:islami_c12_maadi/home/tabs/loadingWidget.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:islami_c12_maadi/providers/pageProvider.dart';
import 'package:islami_c12_maadi/style/AppStyle.dart';
import 'package:provider/provider.dart';
// this is home
class HomeScreen extends StatelessWidget {
  static const String routeName = "Home";

  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
    LoadingWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return ChangeNotifierProvider(
      create: (context)=>PageProvider(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
                  settingsProvider.themeMode == ThemeMode.dark
                  ?"assets/images/home_dark_background.png"
                  : "assets/images/background.png"
          ),fit: BoxFit.fill)
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          bottomNavigationBar: Consumer<PageProvider>(
            builder: (BuildContext context, pageProvider, Widget? child) {
              return BottomNavigationBar(
                  currentIndex: (pageProvider.lastpage>4)?0:pageProvider.lastpage,
                  onTap: (index){

                    pageProvider.changePage(index);

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
                        ),label: AppLocalizations.of(context)!.settings),
                  ]
              );
            },
          ),
          body: Consumer<PageProvider>(
            builder: (BuildContext context, value, Widget? child)
            {
              return tabs[value.lastpage];
            },

        ),
      ),
    ));
  }
}
