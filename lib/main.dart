import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/quran_details/quran_details_screen.dart';

import 'home/home_screen.dart';

void main() {
  // hello world
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        dividerTheme: const DividerThemeData(
          color: Color(0xffB7935F),
          thickness: 3,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xffB7935F),
            unselectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: const Color(0xffB7935F),
            secondary: const Color(0xffB7935F).withOpacity(0.57),
            onPrimary: Colors.white,
            onSecondary: Colors.black),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        cardTheme: CardTheme(
            margin: const EdgeInsets.all(16),
            color: Colors.white.withOpacity(0.8),
            surfaceTintColor: Colors.white.withOpacity(0.8),
            elevation: 30),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranDetailsScreen.routeName: (_) => const QuranDetailsScreen()
      },
    );
  }
}
