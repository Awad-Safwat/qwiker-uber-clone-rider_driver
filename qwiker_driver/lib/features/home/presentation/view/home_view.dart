import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_driver/features/home/presentation/manager/drawer_cubit/drawer_cubit.dart';
import 'package:qwiker_driver/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
