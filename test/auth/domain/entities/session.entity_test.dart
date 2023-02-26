import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SessionEntity session;
  String accessToken = 'accessToken';
  String refreshToken = 'refreshToken';

  setUp(() {
    session = SessionEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  });

  group('Test: Session entity', () {
    test('Session to Json', () async {
      expect(
        session.toJson(),
        <String, dynamic>{
          'accessToken': accessToken,
          'refreshToken': refreshToken,
        },
      );
    });
  });
}
