import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double heightPercentage(double value) {
    assert(value >= 0);
    return height * value;
  }

  double widthPercentage(double value) {
    assert(value >= 0);
    return width * value;
  }

  Locale get currentLocale => Localizations.localeOf(this);

  Locale localeAt(int index) => AppLocalizations.supportedLocales[index];

  List<Locale> get locales => AppLocalizations.supportedLocales;

  AppLocalizations get trad => AppLocalizations.of(this)!;

  String getLocaleName(Locale locale) {
    switch (locale.languageCode) {
      case 'fr':
        return trad.fr;
      default:
        return trad.en;
    }
  }
}
