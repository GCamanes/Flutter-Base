import 'package:flutter_base/core/config/config.holder.dart';
import 'package:flutter_base/core/data/clients/dio.client.dart';
import 'package:flutter_base/core/data/interceptors/app_dio.interceptor.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppDioClient extends DioClient {
  AppDioClient()
      : super(
          AppDioInterceptor(),
          ConfigHolder().config.baseApiUrl,
        );
}
