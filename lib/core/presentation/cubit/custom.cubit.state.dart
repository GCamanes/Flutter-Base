import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/errors/failure.dart';

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

  final Failure failure;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        failure,
      ];
}
