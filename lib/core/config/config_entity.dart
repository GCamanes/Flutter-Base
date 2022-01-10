class ConfigEntity {
  ConfigEntity({
    required this.isProd,
    required this.baseApiUrl,
  });

  factory ConfigEntity.dev() {
    return ConfigEntity(
      isProd : false,
      baseApiUrl: 'https://api-dev.base.com/',
    );
  }

  factory ConfigEntity.prod() {
    return ConfigEntity(
      isProd : true,
      baseApiUrl: 'https://api-prod.base.com/',
    );
  }

  final bool isProd;
  final String baseApiUrl;
}
