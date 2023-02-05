import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/utils/app.constants.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class NoFailure extends Failure {
  const NoFailure() : super('');
}

class EmptyFieldFailure extends Failure {
  const EmptyFieldFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class ConnectivityFailure extends Failure {
  const ConnectivityFailure() : super(AppConstants.connectivityErrorKey);
}

class TimeOutFailure extends Failure {
  const TimeOutFailure() : super(AppConstants.timeOutErrorKey);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(String message) : super(message);
}

class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure(String message) : super(message);
}

class UnknownErrorFailure extends Failure {
  const UnknownErrorFailure(String message) : super(message);
}
