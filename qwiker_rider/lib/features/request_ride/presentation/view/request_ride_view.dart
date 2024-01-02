import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/features/request_ride/data/request_ride_repo_imple/request_ride_repo_imple.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/request_ride_view_body.dart';

class RequestARideView extends StatelessWidget {
  const RequestARideView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestARideViewBody(),
    );
  }
}
