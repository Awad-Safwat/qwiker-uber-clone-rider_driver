import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/views/requested_trips_view.dart';

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
    const RequestedTripsView(),

    // const ProfileView(),
  ];

  List<String> drawerViewsNames = ['Requested Trips', 'Edit Profile'];

  void changSelectedScreen(int selectedScreenNum) {
    selectedView = selectedScreenNum;
    emit(DrawerChangeScreen());
    advancedDrawerController.hideDrawer();
    emit(DrawerInitial());
  }
}
