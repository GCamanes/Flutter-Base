import 'package:flutter_base/core/presentation/cubit/custom.cubit.state.dart';

class HomeLoadingState extends CubitState {}

class HomeLoadedState extends CubitState {
  HomeLoadedState(this.data);

  final List<String> data;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        data,
      ];
}
