import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/features/auth/data/models/session.model.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth.repository.dart';
import 'package:flutter_base/features/auth/domain/use_cases/refresh.use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_resources/test_resources.helper.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repo;
  late RefreshUseCase useCase;
  String refreshToken = 'refreshToken';

  setUp(() {
    repo = MockAuthRepository();
    useCase = RefreshUseCase(repo);
  });

  group('Test: Refresh use case', () {
    test('Success refresh use case', () async {
      final Map<String, dynamic> json =
          await TestResourcesHelper.getSessionJson();

      when(
        () => repo.refresh(refreshToken: refreshToken),
      ).thenAnswer(
        (_) async => Right<FailureEntity, SessionEntity>(
          SessionModel.fromJson(json),
        ),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await useCase.execute(refreshToken);

      expect(sessionOrFailure.isRight(), true);
    });

    test('Error refresh use case', () async {
      when(
        () => repo.refresh(refreshToken: refreshToken),
      ).thenAnswer(
        (_) async => const Left<FailureEntity, SessionEntity>(
          UnknownErrorFailureEntity('failure'),
        ),
      );

      final Either<FailureEntity, SessionEntity> sessionOrFailure =
          await useCase.execute(refreshToken);

      expect(sessionOrFailure.isLeft(), true);
    });
  });
}
