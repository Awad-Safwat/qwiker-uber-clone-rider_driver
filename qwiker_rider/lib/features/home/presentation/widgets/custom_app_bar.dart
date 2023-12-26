import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/home/presentation/manager/drawer_cubit/drawer_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DrawerCubit provider = BlocProvider.of<DrawerCubit>(context);
    return AppBar(
      centerTitle: true,
      title: Text(
        provider.drawerViewsNames[provider.selectedView],
        style: AppFonts.medel_28,
      ),
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: provider.handleMenuButtonPressed,
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: provider.advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Container(
                color: AppColors.whaite,
                child: Icon(
                  value.visible ? Icons.arrow_back : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                  size: 30,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
