import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';

class DetailLoadingState extends CubitState {}

class DetailLoadedState extends CubitState {
  DetailLoadedState(this.detail);

  final String detail;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        detail,
      ];
}
