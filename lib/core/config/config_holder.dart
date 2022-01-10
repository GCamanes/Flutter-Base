import 'package:flutter/material.dart';
import 'package:flutter_base/core/config/config_entity.dart';
import 'package:flutter_base/core/constants/app_constants.dart';

abstract class ConfigHolderBase {
  @protected
  late ConfigEntity currentConfig;

  ConfigEntity get config => currentConfig;

  set config(ConfigEntity newConfig) {
    currentConfig = newConfig;
  }
}

class ConfigHolder extends ConfigHolderBase{
  factory ConfigHolder() {
    return _instance;
  }

  ConfigHolder._internal() {
    currentConfig = ConfigEntity.dev();
  }

  void initialize(String? flavor) {
    switch(flavor) {
      case AppConstants.flavorProd:
        config = ConfigEntity.prod();
        break;
      default:
        config = ConfigEntity.dev();
    }
  }

  static final ConfigHolder _instance = ConfigHolder._internal();
}
