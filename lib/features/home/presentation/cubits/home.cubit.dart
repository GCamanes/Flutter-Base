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
        'Data_1',
        'Data_custom_1',
        'Data_Bonus_1',
        'Data_2',
        'Data_custom_2',
        'Data_Bonus_2',
        'Data_3',
        'Data_custom_3',
        'Data_Bonus_3',
      ],
    ));
  }
}
