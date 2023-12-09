import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_driver/core/routing/app_router.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        debugShowCheckedModeBanner: false,
        title: 'Qwiker driver',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whaiteBlue,
        ),
      ),
    );
  }
}
