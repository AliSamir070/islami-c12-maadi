import 'package:flutter/material.dart';

class AppStyle{
  static Color lightPrimaryColor = Color(0xffB7935F);
  static Color darkPrimaryColor = Color(0xff141A2E);
  static Color darkSecondary = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 25,
        color: Colors.black
      ),
        titleLarge: TextStyle(
          fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.white,
        ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colors.black
      ),

      bodySmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: lightPrimaryColor
      )
    ),
    scaffoldBackgroundColor: Colors.transparent,
    dividerTheme: DividerThemeData(

      color: lightPrimaryColor,
      thickness: 3,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightPrimaryColor,
        unselectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 30
        ),
        selectedIconTheme: IconThemeData(
            color: Colors.black,
            size: 30
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        primary: lightPrimaryColor,
        secondary: lightPrimaryColor.withOpacity(0.57),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        tertiary: lightPrimaryColor
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold
        )
    ),
    cardTheme: CardTheme(
        margin: EdgeInsets.all(16),
        color: Colors.white.withOpacity(0.8),
        surfaceTintColor:Colors.white.withOpacity(0.8) ,
        elevation: 30
    ),
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkPrimaryColor
    ),
    textTheme: TextTheme(
        bodySmall: TextStyle(

            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: darkSecondary

        ),
      titleLarge: TextStyle(
        fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.white
      ),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: darkSecondary
        )
    ),
    scaffoldBackgroundColor: Colors.transparent,
    dividerTheme: DividerThemeData(

      color: darkSecondary,
      thickness: 3,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkPrimaryColor,
        unselectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 30
        ),
        selectedIconTheme: IconThemeData(
            color: darkSecondary,
            size: 30
        ),
        selectedItemColor: darkSecondary,
        unselectedItemColor: Colors.white
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        primary: darkPrimaryColor,
        secondary: Color(0xffB7935F).withOpacity(0.57),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      tertiary: darkSecondary
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
        )
    ),
    cardTheme: CardTheme(
        margin: EdgeInsets.all(16),
        color: darkPrimaryColor.withOpacity(0.8),
        surfaceTintColor:darkPrimaryColor.withOpacity(0.8) ,
        elevation: 30
    ),
    useMaterial3: true,
  );
}