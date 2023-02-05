import 'dart:ui';

import 'package:flutter_base/core/presentation/cubit/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubit/custom.cubit.state.dart';
import 'package:flutter_base/core/presentation/cubit/localization.cubit.state.dart';

class LocalizationCubit extends CustomCubit<CubitState> {
  LocalizationCubit(Locale locale) : super(LocalizationState(locale));

  Future<void> setLocale(Locale newLocale) async {
    emit(LocalizationState(newLocale));
  }
}
