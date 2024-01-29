import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/features/home/presentation/manager/drawer_cubit/drawer_cubit.dart';
import 'package:qwiker_driver/features/home/presentation/widgets/drawer_view_body_items.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerCubit provider = BlocProvider.of<DrawerCubit>(context);
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.mainBlue, AppColors.mainBlue.withOpacity(0.5)],
          ),
        ),
      ),
      controller: provider.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 0.8,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      drawer: const DrawerItems(),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<DrawerCubit, DrawerState>(
              builder: (context, state) {
                return provider.drawerViews[provider.selectedView];
              },
            ),
          ],
        ),
      ),
    );
  }
}
