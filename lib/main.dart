import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/config/config.holder.dart';
import 'package:flutter_base/core/presentation/cubits/app_life_cycle_cubit.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/core/presentation/cubits/localization.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/localization.cubit.state.dart';
import 'package:flutter_base/core/presentation/widget/cubits/app_cubits.listener.dart';
import 'package:flutter_base/core/presentation/widget/cubits/app_cubits.provider.dart';
import 'package:flutter_base/core/utils/app_router.helper.dart';
import 'package:flutter_base/get_it.injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Locale that will be used to init ConfigHolder instance and LocalizationCubit
late Locale initialLocale;

Future<void> _initProject() async {
  /// Manage locale
  String defaultLocaleName = Platform.localeName;
  if (defaultLocaleName.contains('_')) {
    defaultLocaleName = defaultLocaleName.split('_').first;
  }
  initialLocale = Locale(defaultLocaleName);

  /// This line is mandatory to access method channel before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize config holder for the whole app
  await ConfigHolder().initialize(initialLocale);

  /// Init get it dependencies
  configureDependencies();
}

void main() async {
  await _initProject();

  runApp(
    AppCubitsProvider(
      initialLocale: initialLocale,
      builder: (BuildContext context) => const AppCubitsListener(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    /// Listening to app state in cas ewe need to do something in specific cases
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      BlocProvider.of<AppLifeCycleCubit>(context).enterBackground();
    } else if (state == AppLifecycleState.resumed) {
      BlocProvider.of<AppLifeCycleCubit>(context).enterForeground();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, CubitState>(
        builder: (BuildContext context, CubitState state) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: !ConfigHolder().config.isProd,
        locale: (state as LocalizationState).locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: AppRouterHelper.router,
      );
    });
  }
}
