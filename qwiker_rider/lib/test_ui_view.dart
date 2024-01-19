import 'package:flutter/material.dart';

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
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
