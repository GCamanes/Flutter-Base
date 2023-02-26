import 'package:flutter_base/core/config/config.holder.dart';
import 'package:flutter_base/core/data/clients/dio.client.dart';
import 'package:flutter_base/core/data/interceptors/mdb.interceptor.dart';
import 'package:injectable/injectable.dart';

@singleton
class MdbDioClient extends DioClient {
  MdbDioClient()
      : super(
          MdbInterceptor(),
          ConfigHolder().config.baseApiUrl,
        );
}
