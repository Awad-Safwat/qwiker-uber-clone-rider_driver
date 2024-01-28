import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/features/history/presentation/view/history_view.dart';
import 'package:qwiker_rider/features/profile/presentation/view/profile_view.dart';
import 'package:qwiker_rider/features/request_ride/data/request_ride_repo_imple/request_ride_repo_imple.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/view/request_ride_view.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  int selectedView = 2;

  List<Widget> drawerViews = [
    BlocProvider(
      create: (context) =>
          getIt<RequestARideCubit>()..getCurrentRiderPosition(),
      child: const RequestARideView(),
    ),
    const ProfileView(),
    const HistoryView(),
  ];

  List<String> drawerViewsNames = ['Request Ride', 'Edit Profile', 'History'];

  void changSelectedScreen(int selectedScreenNum) {
    getIt.resetLazySingleton<RequestARideCubit>();
    selectedView = selectedScreenNum;
    emit(DrawerChangeScreen());
    advancedDrawerController.hideDrawer();
    emit(DrawerInitial());
  }
}
