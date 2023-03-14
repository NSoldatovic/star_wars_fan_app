import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = Colors.white;
  static Color lightPrimaryColor = Colors.blue;
  static Color lightAccentColor = Colors.green;
  static Color lightNeutralColor = Colors.yellow;

  static Color darkBackgroundColor = Colors.black;
  static Color darkPrimaryColor = Colors.blueGrey;
  static Color darkAccentColor = Colors.lightGreen;
  static Color darkNeutralColor = Colors.yellow;

  const AppTheme._();

  static Brightness get currentSystemBrightness => SchedulerBinding.instance.window.platformBrightness;

  static final lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccentColor, background: lightBackgroundColor,
      brightness: Brightness.light,),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccentColor, background: darkBackgroundColor, brightness: Brightness.dark),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light ? lightBackgroundColor : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent
    ));
  }
}