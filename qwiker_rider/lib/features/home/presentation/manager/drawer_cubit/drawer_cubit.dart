import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/features/profile/presentation/view/profile_view.dart';
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

  int selectedView = 0;

  List<Widget> drawerViews = [
    const RequestARideView(),
    const ProfileView(),
  ];

  List<String> drawerViewsNames = ['', 'Edit Profile'];

  void changSelectedScreen(int selectedScreenNum) {
    selectedView = selectedScreenNum;
    emit(DrawerChangeScreen());
    advancedDrawerController.hideDrawer();
    emit(DrawerInitial());
  }
}
