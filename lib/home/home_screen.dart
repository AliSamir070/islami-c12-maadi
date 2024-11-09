import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/AhadethTab.dart';
import 'package:islami_c12_maadi/home/tabs/QuranTab.dart';
import 'package:islami_c12_maadi/home/tabs/RadioTab.dart';
import 'package:islami_c12_maadi/home/tabs/SebhaTab.dart';

// this is home
class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    const AhadethTab(),
    SebhaTab(),
    const RadioTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
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
                      AssetImage("assets/images/moshaf_blue.png")),
                  label: "Quran"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                      AssetImage("assets/images/ahadeth_icon.png")),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                      AssetImage("assets/images/sebha_icon.png")),
                  label: "Tasbeeh"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const ImageIcon(
                      AssetImage("assets/images/radio_icon.png")),
                  label: "Radio")
            ]),
        body: tabs[currentIndex],
      ),
    );
  }
}
