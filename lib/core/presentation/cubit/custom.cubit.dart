import 'dart:developer';

import 'package:flutter_base/core/config/config.holder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// F-Generic cubit class to define custom behavior
abstract class CustomCubit<State> extends Cubit<State> {
  CustomCubit(State state) : super(state);

  @override
  void emit(State state) {
    /// Override to log info on cubit state only for dev flavor
    if (!isClosed && !ConfigHolder().config.isProd) {
      String str = 'EVENT $runtimeType -- ${state.toString()}';
      log(str);
      super.emit(state);
    }
  }

  /*@override
  Future<void> close() async {
    super.close();
  }*/
}
