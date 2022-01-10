import 'package:flutter/material.dart';

abstract class AppConstants {
  // Flavors
  static const String flavorDev = 'dev';
  static const String flavorProd = 'prod';

  // Localization
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];
  static List<String> supportedLanguages =
      supportedLocales.map((Locale locale) => locale.languageCode).toList();
}
