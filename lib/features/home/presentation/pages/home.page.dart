import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/context.extension.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/core/utils/ui.constants.dart';
import 'package:flutter_base/features/home/presentation/cubits/home.cubit.dart';
import 'package:flutter_base/features/home/presentation/cubits/home.cubit.state.dart';
import 'package:flutter_base/features/home/presentation/widgets/home_tile.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit _homeCubit = HomeCubit();

  @override
  void initState() {
    _getHomeData();
    super.initState();
  }

  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }

  void _getHomeData() => _homeCubit.getData();

  Widget _buildChild(CubitState state) {
    if (state is HomeLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is HomeLoadedState) {
      return ListView.separated(
        padding: const EdgeInsets.all(UIConstants.padding),
        itemBuilder: (BuildContext context, int index) =>
            HomeTileWidget(title: state.data[index]),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: UIConstants.innerPadding,
        ),
        itemCount: state.data.length,
      );
    } else if (state is CubitErrorState) {
      return Center(
        child: Text('ERROR ${state.failure.message}'),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, CubitState>(
      bloc: _homeCubit,
      builder: (BuildContext context, CubitState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.trad.home),
          ),
          body: _buildChild(state),
        );
      },
    );
  }
}
