import 'package:flutter_base/core/presentation/cubits/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/splashscreen/presentation/cubits/assets.state.dart';

class AssetsCubit extends CustomCubit<CubitState> {
  AssetsCubit() : super(CubitInitState());

  Future<void> getAssets() async {
    emit(AssetsLoadingState());
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(AssetsLoadedState(const <String>[]));
  }
}
