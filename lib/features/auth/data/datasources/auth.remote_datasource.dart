import 'package:flutter_base/features/auth/data/models/session.model.dart';

abstract class AuthRemoteDataSource {
  Future<SessionModel> authenticate({
    required String email,
    required String password,
  });

  Future<SessionModel> refresh({
    required String refreshToken,
  });
}
