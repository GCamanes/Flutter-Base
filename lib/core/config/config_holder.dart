import 'package:flutter/material.dart';
import 'package:flutter_base/core/config/config_entity.dart';
import 'package:flutter_base/core/helpers/channel_helper.dart';

abstract class ConfigHolderBase {
  @protected
  late ConfigEntity currentConfig;

  ConfigEntity get config => currentConfig;

  set config(ConfigEntity newConfig) {
    currentConfig = newConfig;
  }
}

class ConfigHolder extends ConfigHolderBase {
  factory ConfigHolder() {
    return _instance;
  }

  ConfigHolder._default() {
    currentConfig = ConfigEntity(
      flavor: 'none',
      baseApiUrl: '',
    );
  }

  Future<void> initialize() async {
    String? flavor = await ChannelHelper.getFlavor();
    String? apiUrl = await ChannelHelper.getApiUrl();
    currentConfig = ConfigEntity(
      flavor: flavor ?? '',
      baseApiUrl: apiUrl ?? '',
    );
  }

  static final ConfigHolder _instance = ConfigHolder._default();
}
