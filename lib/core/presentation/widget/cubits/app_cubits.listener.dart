import 'package:flutter/material.dart';
import 'package:flutter_base/core/config/config.holder.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/core/presentation/cubits/localization.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/localization.cubit.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitsListener extends StatelessWidget {
  const AppCubitsListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: <BlocListener<CustomCubit<CubitState>, CubitState>>[
        BlocListener<LocalizationCubit, CubitState>(
          listener: (BuildContext context, CubitState state) {
            ConfigHolder().locale = (state as LocalizationState).locale;
          },
        )
      ],
      child: child,
    );
  }
}
