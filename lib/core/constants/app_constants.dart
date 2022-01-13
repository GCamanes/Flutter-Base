import 'package:flutter/material.dart';

abstract class AppConstants {
  // Flavors
  static const String flavorDevKey = 'dev';
  static const String flavorProdKey = 'prod';

  // Localization
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];
  static List<String> supportedLanguages =
      supportedLocales.map((Locale locale) => locale.languageCode).toList();
}
