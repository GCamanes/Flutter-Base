import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/utils/app.constants.dart';

abstract class FailureEntity extends Equatable {
  const FailureEntity(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class NoFailureEntity extends FailureEntity {
  const NoFailureEntity() : super('');
}

class EmptyFieldFailureEntity extends FailureEntity {
  const EmptyFieldFailureEntity(String message) : super(message);
}

class CacheFailureEntity extends FailureEntity {
  const CacheFailureEntity(String message) : super(message);
}

class ConnectivityFailureEntity extends FailureEntity {
  const ConnectivityFailureEntity() : super(AppConstants.connectivityErrorKey);
}

class TimeOutFailureEntity extends FailureEntity {
  const TimeOutFailureEntity() : super(AppConstants.timeOutErrorKey);
}

class UnauthorizedFailureEntity extends FailureEntity {
  const UnauthorizedFailureEntity(String message) : super(message);
}

class InternalServerErrorFailureEntity extends FailureEntity {
  const InternalServerErrorFailureEntity(String message) : super(message);
}

class UnknownErrorFailureEntity extends FailureEntity {
  const UnknownErrorFailureEntity(String message) : super(message);
}
