import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/views/requested_trips_view.dart';
import 'package:qwiker_driver/features/history/presentation/view/history_view.dart';
import 'package:qwiker_driver/features/profile/presentation/view/profile_view.dart';
import 'package:qwiker_driver/features/reviews/presentation/view/reviewes_view.dart';
import 'package:qwiker_driver/features/settings/settings_view.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  int selectedView = 0;

  List<Widget> drawerViews = [
    BlocProvider(
      create: (context) => getIt<AccepteATripCubit>(),
      child: const RequestedTripsView(),
    ),
    const ProfileView(),
    const HistoryView(),
    const ReviewesView(),
    const SettingsView(),
  ];

  List<String> drawerViewsNames = [
    'Requested Trips',
    'Edit Profile',
    'History',
    'Reviewes',
    'Settings'
  ];

  void changSelectedScreen(int selectedScreenNum) {
    getIt.resetLazySingleton<AccepteATripCubit>();
    selectedView = selectedScreenNum;
    emit(DrawerChangeScreen());
    advancedDrawerController.hideDrawer();
    emit(DrawerInitial());
  }
}
