import 'package:dio/dio.dart';
import 'package:flutter_base/core/data/interceptors/dio.interceptor.dart';

abstract class DioClient {
  DioClient(
    this._dioInterceptor,
    this._baseUrl,
  );

  Dio? _dio;

  Dio get dio => _dio ??= _init();

  final DioInterceptor _dioInterceptor;
  final String _baseUrl;

  Dio _init() {
    _dio = Dio();

    /// Add dio ref to interceptor
    _dioInterceptor.init(
      dioRef: _dio!,
    );

    /// Specify interceptor (error management)
    _dio!.interceptors.add(
      _dioInterceptor,
    );
    _dio!.interceptors.add(LogInterceptor(
      request: false,
      // requestBody: false,
      requestHeader: false,
      // responseBody: false,
      responseHeader: false,
    ));

    /// Specify base api url
    _dio!.options.baseUrl = _baseUrl;

    /// Specify base api url
    _dio!.options.contentType = 'application/json';

    /// Specify response valid status
    _dio!.options.validateStatus = (int? status) => (status ?? 400) < 400;

    /// Specify timeout limit
    _dio!.options.connectTimeout = const Duration(seconds: 15);
    return _dio!;
  }
}
