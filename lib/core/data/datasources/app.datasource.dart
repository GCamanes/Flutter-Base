import 'package:flutter_base/core/data/clients/app_dio.client.dart';
import 'package:flutter_base/core/data/datasources/remote.datasource.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppDataSource extends RemoteDataSource {
  AppDataSource(AppDioClient dioClient) : super(dioClient);
}
