import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';

class AuthLoadingState extends CubitState {}

class AuthInState extends CubitState {
  AuthInState(this.session);

  final SessionEntity session;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        session,
      ];
}

class AuthOutState extends CubitState {
  AuthOutState(this.failure);

  final FailureEntity failure;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        failure,
      ];
}
