import 'package:flutter/material.dart';
import 'package:qwiker_driver/features/home/presentation/widgets/custom_app_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Spacer(),
          Center(
            child: Text('Coming Soon ...'),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
