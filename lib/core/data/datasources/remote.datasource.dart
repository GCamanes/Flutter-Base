import 'package:dio/dio.dart';
import 'package:flutter_base/core/data/clients/dio.client.dart';
import 'package:flutter_base/core/errors/exception.handler.dart';

abstract class RemoteDataSource {
  RemoteDataSource(this.dioClient);

  final DioClient dioClient;

  Future<Response<dynamic>> performRequest<T>(
      Future<Response<dynamic>> Function() request) async {
    try {
      return await request();
    } on DioError catch (error) {
      throw ExceptionHandler.handleApiError(error);
    } on Exception {
      rethrow;
    }
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await performRequest(() => dioClient.dio.get(
          path,
          queryParameters: queryParameters,
          options: options,
        ));
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await performRequest(() => dioClient.dio.post(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
        ));
  }

  Future<Response<dynamic>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await performRequest(() => dioClient.dio.put(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
        ));
  }

  Future<Response<dynamic>> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await performRequest(() => dioClient.dio.delete(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        ));
  }

  Future<Response<dynamic>> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await performRequest(() => dioClient.dio.patch(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
        ));
  }
}
