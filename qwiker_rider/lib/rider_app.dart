import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_rider/core/routing/app_router.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/global_functions.dart';

class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        debugShowCheckedModeBanner: false,
        title: 'Qwiker Rider',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whaiteBlue,
        ),
      ),
    );
  }
}
