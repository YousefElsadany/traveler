import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

var darkMode = ThemeData(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: Color(0xff1e272e),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff1e272e),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Color(0xff1e272e),
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xff1e272e),
    ));

ThemeData lightMode = ThemeData(
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: fullBackgroundColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: fullBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: fullBackgroundColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
    ));
