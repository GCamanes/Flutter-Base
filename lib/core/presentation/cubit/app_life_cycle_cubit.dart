import 'package:flutter_base/core/presentation/cubit/app_life_cycle_cubit.state.dart';
import 'package:flutter_base/core/presentation/cubit/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubit/custom.cubit.state.dart';

class AppLifeCycleCubit extends CustomCubit<CubitState> {
  AppLifeCycleCubit() : super(ForegroundState(Duration.zero));

  void enterBackground() {
    if (state is! BackgroundState) {
      emit(BackgroundState(DateTime.now()));
    }
  }

  void enterForeground() {
    Duration backgroundTime = Duration.zero;
    if (state is BackgroundState) {
      final DateTime inBackground = (state as BackgroundState).since;
      backgroundTime = DateTime.now().difference(inBackground);
    }
    emit(ForegroundState(backgroundTime));
  }
}
