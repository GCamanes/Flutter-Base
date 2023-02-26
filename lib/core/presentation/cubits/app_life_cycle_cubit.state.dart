import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';

class BackgroundState extends CubitState {
  BackgroundState(this.since);

  final DateTime since;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        since,
      ];
}

class ForegroundState extends CubitState {
  ForegroundState(this.backgroundTime);

  final Duration backgroundTime;

  @override
  List<Object> get props => <Object>[
        ...super.props,
        backgroundTime,
      ];
}
