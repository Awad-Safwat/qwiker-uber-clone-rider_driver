import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/core/widgets/custom_button.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/waiting_for_driver_widget.dart';

class TestUiView extends StatefulWidget {
  const TestUiView({super.key});

  @override
  State<TestUiView> createState() => _TestUiViewState();
}

class _TestUiViewState extends State<TestUiView> {
  String isSelected = "Car";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 500.h,
            child: const WaitingForDriverWidget(),
          ),
        ],
      ),
    );
  }
}
