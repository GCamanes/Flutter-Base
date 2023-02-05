import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/config/config.holder.dart';
import 'package:flutter_base/core/extensions/context.extension.dart';
import 'package:flutter_base/core/presentation/cubit/app_life_cycle_cubit.dart';
import 'package:flutter_base/core/presentation/cubit/custom.cubit.state.dart';
import 'package:flutter_base/core/presentation/cubit/localization.cubit.dart';
import 'package:flutter_base/core/presentation/cubit/localization.cubit.state.dart';
import 'package:flutter_base/core/presentation/widget/cubit/app_cubits.listener.dart';
import 'package:flutter_base/core/presentation/widget/cubit/app_cubits.provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Locale that will be used to init ConfigHolder instance and LocalizationCubit
late Locale initialLocale;

Future<void> _initProject() async {
  /// This line is mandatory to access method channel before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  String defaultLocaleName = Platform.localeName;
  if (defaultLocaleName.contains('_')) {
    defaultLocaleName = defaultLocaleName.split('_').first;
  }
  initialLocale = Locale(defaultLocaleName);

  await ConfigHolder().initialize(initialLocale);
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
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: !ConfigHolder().config.isProd,
        locale: (state as LocalizationState).locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Base ${ConfigHolder().config.flavor}'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.trad.welcome),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
