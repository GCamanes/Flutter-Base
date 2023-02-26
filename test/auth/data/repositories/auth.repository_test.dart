import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/features/auth/data/datasources/auth.remote_datasource.dart';
import 'package:flutter_base/features/auth/data/models/session.model.dart';
import 'package:flutter_base/features/auth/data/repositories/auth.repository.impl.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_resources/test_resources.helper.dart';

class MockAuthDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late MockAuthDataSource dataSource;
  late AuthRepositoryImpl authRepository;
  String email = 'email';
  String password = 'password';
  String refreshToken = 'refreshToken';

  setUp(() {
    dataSource = MockAuthDataSource();
    authRepository = AuthRepositoryImpl(dataSource);
  });

  group('Test: Auth repository', () {
    test('Success repo auth case', () async {
      final Map<String, dynamic> json =
          await TestResourcesHelper.getSessionJson();

      when(
        () => dataSource.authenticate(
          email: email,
          password: password,
        ),
      ).thenAnswer(
        (_) async => SessionModel.fromJson(json),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await authRepository.authenticate(
        email: email,
        password: password,
      );

      expect(sessionOrFailure.isRight(), true);
    });

    test('Error repo auth case', () async {
      when(
        () => dataSource.authenticate(
          email: email,
          password: password,
        ),
      ).thenAnswer(
        (_) async => throw Exception(),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await authRepository.authenticate(
        email: email,
        password: password,
      );

      expect(sessionOrFailure.isLeft(), true);
    });

    test('Success repo refresh case', () async {
      final Map<String, dynamic> json =
          await TestResourcesHelper.getSessionJson();

      when(
        () => dataSource.refresh(
          refreshToken: refreshToken,
        ),
      ).thenAnswer(
        (_) async => SessionModel.fromJson(json),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await authRepository.refresh(refreshToken: refreshToken);

      expect(sessionOrFailure.isRight(), true);
    });

    test('Error repo refresh case', () async {
      when(
        () => dataSource.refresh(
          refreshToken: refreshToken,
        ),
      ).thenAnswer(
        (_) async => throw Exception(),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await authRepository.refresh(refreshToken: refreshToken);

      expect(sessionOrFailure.isLeft(), true);
    });
  });
}
