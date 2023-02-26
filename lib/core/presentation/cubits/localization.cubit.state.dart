import 'dart:ui';

import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';

class LocalizationState extends CubitState {
  LocalizationState(this.locale);

  final Locale locale;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        locale,
      ];
}
