import 'package:flutter_base/core/presentation/cubit/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubit/custom.cubit.state.dart';
import 'package:flutter_base/features/splashscreen/presentation/cubit/assets.cubit.state.dart';

class AssetsCubit extends CustomCubit<CubitState> {
  AssetsCubit() : super(CubitInitState());

  Future<void> getAssets() async {
    print('GET ASSETS');
    emit(AssetsLoadingState());
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(AssetsLoadedState(const <String>[]));
    print('GOT ASSETS');
  }
}
