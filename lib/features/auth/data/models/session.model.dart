import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';

class SessionModel extends SessionEntity {
  const SessionModel({
    required String accessToken,
    required String refreshToken,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}
