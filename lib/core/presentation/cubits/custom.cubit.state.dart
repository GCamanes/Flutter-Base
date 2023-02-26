import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';

/// Custom abstract class to define generic state for all cubits
abstract class CubitState extends Equatable {
  final int privateTimeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => <Object>[
        privateTimeStamp,
      ];
}

class CubitInitState extends CubitState {}

class CubitErrorState extends CubitState {
  CubitErrorState(this.failure);

  final FailureEntity failure;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        failure,
      ];
}
