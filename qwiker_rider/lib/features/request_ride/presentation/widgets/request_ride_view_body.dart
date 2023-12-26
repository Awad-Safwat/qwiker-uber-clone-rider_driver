import 'package:flutter/material.dart';
import 'package:qwiker_rider/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/buttom_location_menu.dart';

class RequestARideViewBody extends StatelessWidget {
  const RequestARideViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            "assets/images/map.png",
            fit: BoxFit.fill,
          ),
        ),
        const Positioned(
          child: CustomAppBar(),
        ),
        const ButtomLocationMenu(),
      ],
    );
  }
}
