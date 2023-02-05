import 'package:flutter/material.dart';
import 'package:flutter_base/core/config/config.entity.dart';
import 'package:flutter_base/core/utils/app.constants.dart';
import 'package:flutter_base/core/utils/channel.helper.dart';

abstract class ConfigHolderBase {
  @protected
  late ConfigEntity currentConfig;

  ConfigEntity get config => currentConfig;

  set config(ConfigEntity newConfig) {
    currentConfig = newConfig;
  }

  /// Default to english
  @protected
  late Locale currentLocale;

  Locale get locale => currentLocale;

  set locale(Locale newLocale) {
    currentLocale = newLocale;
  }
}

class ConfigHolder extends ConfigHolderBase {
  factory ConfigHolder() {
    return _instance;
  }

  ConfigHolder._default() {
    currentLocale = const Locale(AppConstants.localeEn);
    currentConfig = ConfigEntity(
      flavor: '',
      baseApiUrl: '',
    );
  }

  Future<void> initialize(Locale locale) async {
    _instance.currentLocale = locale;
    String? flavor = await ChannelHelper.getFlavor();
    String? apiUrl = await ChannelHelper.getApiUrl();
    currentConfig = ConfigEntity(
      flavor: flavor ?? '',
      baseApiUrl: apiUrl ?? '',
    );
  }

  static final ConfigHolder _instance = ConfigHolder._default();

  static Locale get appLocale => _instance.currentLocale;

  static String get appLocaleCode => _instance.currentLocale.languageCode;
}
