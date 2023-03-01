import 'package:flutter_base/core/presentation/cubits/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/detail/presentation/cubits/detail.state.dart';

class DetailCubit extends CustomCubit<CubitState> {
  DetailCubit() : super(CubitInitState());

  Future<void> getDetail(String id) async {
    emit(DetailLoadingState());
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(DetailLoadedState('Detail : $id'));
  }
}
