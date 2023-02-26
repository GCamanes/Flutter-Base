import 'package:flutter_base/core/utils/app.constants.dart';

class ErrorEntity {
  ErrorEntity({
    required this.code,
    required this.label,
  });

  factory ErrorEntity.fromJson(Map<String, dynamic> json) {
    return ErrorEntity(
      code: json['code'] ?? '',
      label: json['label'] ?? '',
    );
  }

  factory ErrorEntity.unknown() => ErrorEntity(
        code: AppConstants.unknownErrorKey,
        label: 'unknown error',
      );

  factory ErrorEntity.code(String code) => ErrorEntity(
        code: code,
        label: '',
      );

  final String code;
  final String label;
}
