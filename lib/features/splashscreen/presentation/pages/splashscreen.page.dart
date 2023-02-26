import 'package:flutter/material.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/home/presentation/pages/home.page.dart';
import 'package:flutter_base/features/splashscreen/presentation/cubits/assets.cubit.dart';
import 'package:flutter_base/features/splashscreen/presentation/cubits/assets.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    _getAssets();
    super.initState();
  }

  void _getAssets() => BlocProvider.of<AssetsCubit>(context).getAssets();

  void _goToNextPage() => Navigator.pushReplacement(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const HomePage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssetsCubit, CubitState>(
      builder: (BuildContext context, CubitState state) {
        return Scaffold(
          body: Center(
            child: (state is CubitErrorState)
                ? Text('ERROR ${state.failure.message}')
                : const CircularProgressIndicator(),
          ),
        );
      },
      listener: (BuildContext context, CubitState state) {
        if (state is AssetsLoadedState) {
          _goToNextPage();
        }
      },
    );
  }
}
