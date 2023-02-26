import 'dart:ui';

import 'package:flutter_base/core/presentation/cubits/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/core/presentation/cubits/localization.cubit.state.dart';

class LocalizationCubit extends CustomCubit<CubitState> {
  LocalizationCubit(Locale locale) : super(LocalizationState(locale));

  Future<void> setLocale(Locale newLocale) async {
    emit(LocalizationState(newLocale));
  }
}
