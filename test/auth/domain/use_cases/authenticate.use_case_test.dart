import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/features/auth/data/models/session.model.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth.repository.dart';
import 'package:flutter_base/features/auth/domain/use_cases/authenticate.use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_resources/test_resources.helper.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repo;
  late AuthenticateUseCase useCase;
  String email = 'email';
  String password = 'password';

  setUp(() {
    repo = MockAuthRepository();
    useCase = AuthenticateUseCase(repo);
  });

  group('Test: Authenticate use case', () {
    test('Success authenticate use case', () async {
      final Map<String, dynamic> json =
          await TestResourcesHelper.getSessionJson();

      when(
        () => repo.authenticate(
          email: email,
          password: password,
        ),
      ).thenAnswer(
        (_) async => Right<FailureEntity, SessionEntity>(
          SessionModel.fromJson(json),
        ),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await useCase.execute(AuthenticateParams(email, password));

      expect(sessionOrFailure.isRight(), true);
    });

    test('Error authenticate use case', () async {
      when(
        () => repo.authenticate(
          email: email,
          password: password,
        ),
      ).thenAnswer(
        (_) async => const Left<FailureEntity, SessionEntity>(
          UnknownErrorFailureEntity('failure'),
        ),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await useCase.execute(AuthenticateParams(email, password));

      expect(sessionOrFailure.isLeft(), true);
    });
  });
}
