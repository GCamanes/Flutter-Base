import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';

class AssetsLoadingState extends CubitState {}

class AssetsLoadedState extends CubitState {
  AssetsLoadedState(this.assets);

  final List<String> assets;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        assets,
      ];
}
