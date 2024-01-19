import 'package:flutter/material.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_details_section.dart';

class TestUiView extends StatelessWidget {
  const TestUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.cover,
            ),
          ),
          //  const TripDetailsSection(),
        ],
      ),
    );
  }
}
