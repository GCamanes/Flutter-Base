import 'package:flutter_base/core/presentation/cubits/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/home/presentation/cubits/home.cubit.state.dart';

class HomeCubit extends CustomCubit<CubitState> {
  HomeCubit() : super(CubitInitState());

  Future<void> getData() async {
    emit(HomeLoadingState());
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(HomeLoadedState(
      const <String>[
        'Data 1',
        'Data custom 1',
        'Data Bonus 1',
        'Data 2',
        'Data custom 2',
        'Data Bonus 2',
        'Data 3',
        'Data custom 3',
        'Data Bonus 3',
      ],
    ));
  }
}
