import 'package:flutter_base/core/data/clients/mdb_dio.client.dart';
import 'package:flutter_base/core/data/datasources/remote.datasource.dart';
import 'package:injectable/injectable.dart';

@singleton
class MdbDataSource extends RemoteDataSource {
  MdbDataSource(MdbDioClient dioClient) : super(dioClient);
}
