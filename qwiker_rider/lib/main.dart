import 'package:flutter/widgets.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/rider_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isFirstTime = await checkFirstSeen();
  runApp(const RiderApp());
}
