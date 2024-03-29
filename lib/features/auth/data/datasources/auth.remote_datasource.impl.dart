import 'package:dio/dio.dart';
import 'package:flutter_base/core/data/datasources/app.datasource.dart';
import 'package:flutter_base/core/utils/app.constants.dart';
import 'package:flutter_base/features/auth/data/datasources/auth.remote_datasource.dart';
import 'package:flutter_base/features/auth/data/models/session.model.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dataSource);

  final AppDataSource _dataSource;

  @override
  Future<SessionModel> authenticate({
    required String email,
    required String password,
  }) async {
    final Response<dynamic> response =
        await _dataSource.get(AppConstants.remoteAuthenticatePath,
            options: Options(headers: <String, dynamic>{
              'email': email,
              'password': password,
            }));
    return SessionModel.fromJson(response.data);
  }

  @override
  Future<SessionModel> refresh({
    required String refreshToken,
  }) async {
    final Response<dynamic> response = await _dataSource.get(
      '${AppConstants.remoteAuthenticatePath}'
      '${AppConstants.remoteRefreshPath}'
      '?token=$refreshToken',
    );
    return SessionModel.fromJson(response.data);
  }
}
