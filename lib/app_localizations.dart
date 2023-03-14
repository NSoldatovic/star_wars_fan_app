import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {

  final Locale locale;
  static String? localeLanguageCode;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedEn;

  Future<bool> loadEnglish() async {
    String jsonString = await rootBundle.loadString('lang/en.json');
    Map<String,dynamic> jsonMap = json.decode(jsonString);
    _localizedEn = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? translate(String key) {
    return _localizedEn[key];
  }

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    try {
      await localizations.loadEnglish();
      return localizations;
    }
    catch(e) {
      print(e);
      return localizations;
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;

}