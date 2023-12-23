import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/app_bloc_observer.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/firebase_options.dart';
import 'package:qwiker_rider/rider_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  isFirstTime = await checkFirstSeen();
  hasProfile = await checkUserProfile();
  runApp(const RiderApp());
}
