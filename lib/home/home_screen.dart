import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/ahadeth_tab.dart';
import 'package:islami_c12_maadi/home/tabs/quran_tab.dart';
import 'package:islami_c12_maadi/home/tabs/radio_tab.dart';
import 'package:islami_c12_maadi/home/tabs/sebha_tab.dart';

// this is home
class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [QuranTab(), AhadethTab(), SebhaTab(), RadioTab()];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/default_bg.png",
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Islami"),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_quran.png")),
                  label: "Quran"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                    AssetImage("assets/images/icon_hadeth.png"),
                  ),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                    AssetImage("assets/images/icon_sebha.png"),
                  ),
                  label: "Tasbeeh"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                    AssetImage("assets/images/icon_radio.png"),
                  ),
                  label: "Radio")
            ]),
        body: tabs[currentIndex],
      ),
    );
  }
}
