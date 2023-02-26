import 'dart:convert';

import 'package:dio/dio.dart';

abstract class DioInterceptor extends Interceptor {
  late final Dio dioReference;

  void init({
    required Dio dioRef,
  }) {
    dioReference = dioRef;
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data is String && (response.data as String).isNotEmpty) {
      response.data = jsonDecode(response.data);
    }

    return super.onResponse(response, handler);
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) =>
      dioReference.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
        ),
      );
}
