import 'package:flutter/material.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/detail/presentation/cubits/detail.cubit.dart';
import 'package:flutter_base/features/detail/presentation/cubits/detail.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailCubit _detailCubit = DetailCubit();

  @override
  void initState() {
    _getDetail();
    super.initState();
  }

  void _getDetail() => _detailCubit.getDetail(widget.id);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCubit, CubitState>(
      bloc: _detailCubit,
      builder: (BuildContext context, CubitState state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: (state is DetailLoadedState)
                ? Text(state.detail)
                : const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
