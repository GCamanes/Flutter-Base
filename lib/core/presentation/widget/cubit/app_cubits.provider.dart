import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/context.extension.dart';
import 'package:flutter_base/core/presentation/cubit/app_life_cycle_cubit.dart';
import 'package:flutter_base/core/presentation/cubit/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubit/custom.cubit.state.dart';
import 'package:flutter_base/core/presentation/cubit/localization.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitsProvider extends StatelessWidget {
  const AppCubitsProvider({
    Key? key,
    required this.builder,
    this.initialLocale,
  }) : super(key: key);

  final WidgetBuilder builder;
  final Locale? initialLocale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<CustomCubit<CubitState>>>[
        BlocProvider<AppLifeCycleCubit>(
          create: (BuildContext context) => AppLifeCycleCubit(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (BuildContext context) => LocalizationCubit(
            initialLocale ?? context.locales.first,
          ),
        ),
      ],
      child: builder(context),
    );
  }
}
