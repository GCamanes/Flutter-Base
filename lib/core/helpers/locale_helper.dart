import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleHelper {
  static void toggleLocale(BuildContext context) {
    if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('fr'));
    } else {
      context.setLocale(const Locale('en'));
    }
  }
}