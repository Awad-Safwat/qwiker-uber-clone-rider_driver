import 'package:flutter/material.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/request_ride_view_body.dart';

class RequestARideView extends StatelessWidget {
  const RequestARideView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestARideViewBody(),
    );
  }
}
