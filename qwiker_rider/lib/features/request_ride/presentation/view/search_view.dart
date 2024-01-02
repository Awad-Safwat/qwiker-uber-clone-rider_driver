import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/features/request_ride/data/request_ride_repo_imple/request_ride_repo_imple.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/serch_place_cubit/search_place_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchPlaceCubit(
              requestRideRepoImple: getIt<RequestRideRepoImple>()),
        ),
        BlocProvider.value(
          value: getIt<RequestARideCubit>(),
        ),
      ],
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
