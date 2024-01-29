import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/current_trip_view_body.dart';

class CurrentTripView extends StatelessWidget {
  const CurrentTripView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var accepteATripCubit = BlocProvider.of<AccepteATripCubit>(context);
    accepteATripCubit.notifyDriverOnWayToStartPoint();
    return const Scaffold(
      body: CurrentTripViewBody(),
    );
  }
}
