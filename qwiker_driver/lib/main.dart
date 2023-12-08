import 'package:flutter/material.dart';
import 'package:qwiker_driver/driver_app.dart';

import 'core/global_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isFirstTime = await checkFirstSeen();
  runApp(const DriverApp());
}
