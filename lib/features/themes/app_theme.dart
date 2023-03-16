import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/fonts.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xFFF5F8FF);
  static Color lightContrastColor = darkBackgroundColor;
  static Color lightPrimaryColor = const Color(0xFFFFFFFF);
  static Color lightAccentColor = const Color(0xFFFFE81F);

  static Color darkBackgroundColor = const Color(0xFF262626);
  static Color darkContrastColor = lightBackgroundColor;
  static Color darkPrimaryColor = const Color(0xFF3B3B3B);
  static Color darkAccentColor = const Color(0xFFFFE81F);

  const AppTheme._();

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static final lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightAccentColor,
      background: lightBackgroundColor,
      brightness: Brightness.light,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: darkAccentColor,
        background: darkBackgroundColor,
        brightness: Brightness.dark),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: themeMode == ThemeMode.light
            ? lightBackgroundColor
            : darkBackgroundColor,
        systemNavigationBarDividerColor: Colors.transparent));
  }
}

extension ThemeX on ThemeData {

  bool get isLightTheme => brightness == Brightness.light;

  Color get contrastColor => isLightTheme
      ? AppTheme.lightContrastColor
      : AppTheme.darkContrastColor;

  Color get buttonTextColor => AppTheme.darkBackgroundColor;

  TextStyle get normalText {
    return TextStyle(
      fontFamily: font_montserrat,
      color: contrastColor,
    );
  }

  TextStyle get boldText {
    return TextStyle(
      fontFamily: font_montserrat,
      color: contrastColor,
      fontWeight: FontWeight.w600
    );
  }

  TextStyle get buttonText {
    return TextStyle(
      fontFamily: font_montserrat,
      color: buttonTextColor,
      fontWeight: FontWeight.w600
    );
  }

  TextStyle get headerHollowText {
    return TextStyle(
      fontFamily: font_star_jedi_hollow,
      color: contrastColor,
    );
  }

  TextStyle get headerOutlineText {
    return TextStyle(
      fontFamily: font_star_jedi_outline,
      color: contrastColor,
    );
  }

  TextStyle get headerRegularText {
    return TextStyle(
      fontFamily: font_star_jedi_regular,
      color: contrastColor,
    );
  }

  Color getColorByType(ResourceType type) {
    switch(type) {
      case ResourceType.people:
        return peopleColor;
      case ResourceType.films:
        return filmsColor;
      case ResourceType.starships:
        return starshipsColor;
      case ResourceType.vehicles:
        return vehiclesColor;
      case ResourceType.species:
        return speciesColor;
      case ResourceType.planets:
        return planetsColor;
    }
  }

  Color get peopleColor => Colors.red;

  Color get filmsColor => Colors.blueGrey;

  Color get starshipsColor => Colors.blueAccent;

  Color get vehiclesColor => Colors.grey;

  Color get speciesColor => Colors.pink;

  Color get planetsColor => Colors.green;
}
