import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/home/presentation/manager/drawer_cubit/drawer_cubit.dart';
import 'package:qwiker_rider/features/home/presentation/widgets/drawer_view_body_items.dart';

class HomeViewBody2 extends StatelessWidget {
  const HomeViewBody2({super.key});

  @override
  Widget build(BuildContext context) {
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
      controller:
          BlocProvider.of<DrawerCubit>(context).advancedDrawerController,
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            BlocProvider.of<DrawerCubit>(context).drawerViewsNames[0],
            style: AppFonts.medel_28,
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed:
                BlocProvider.of<DrawerCubit>(context).handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: BlocProvider.of<DrawerCubit>(context)
                  .advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.arrow_back : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: BlocProvider.of<DrawerCubit>(context)
            .drawerViews[BlocProvider.of<DrawerCubit>(context).selectedView],
      ),
    );
  }
}
