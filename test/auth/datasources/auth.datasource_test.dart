import 'package:dio/dio.dart';
import 'package:flutter_base/core/data/datasources/app.datasource.dart';
import 'package:flutter_base/features/auth/data/datasources/auth.remote_datasource.impl.dart';
import 'package:flutter_base/features/auth/data/models/session.model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_resources/test_resources.helper.dart';

class MockAppDataSource extends Mock implements AppDataSource {}

void main() {
  late MockAppDataSource dataSource;
  late AuthRemoteDataSourceImpl authRemoteDataSource;
  String email = 'email';
  String password = 'password';

  setUp(() {
    dataSource = MockAppDataSource();
    authRemoteDataSource = AuthRemoteDataSourceImpl(dataSource);
  });

  group('Test: Auth remote data source', () {
    test('Success auth case', () async {
      final Map<String, dynamic> json =
          await TestResourcesHelper.getSessionJson();

      when(
        () => dataSource.get(
          any(),
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(),
          data: json,
        ),
      );

      final dynamic response = await authRemoteDataSource.authenticate(
        email: email,
        password: password,
      );

      expect(response.runtimeType, SessionModel);
    });
  });
}
