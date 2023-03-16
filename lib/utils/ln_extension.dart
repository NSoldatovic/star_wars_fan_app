import 'package:flutter/cupertino.dart';
import 'package:star_wars_fan_app/app_localizations.dart';

extension LnX on BuildContext{
  String translate(String key) {
    return AppLocalizations.of(this).translate(key) ?? "";
  }
}