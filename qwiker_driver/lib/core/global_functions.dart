// check first time or not to show onboarding screen
import 'package:shared_preferences/shared_preferences.dart';

Future<bool>? checkFirstSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstT = (prefs.getBool('seen') ?? true);

  if (isFirstT) {
    await prefs.setBool('seen', false);
    //is first time
    return true;
  } else {
    //not the first time
    return false;
  }
}

bool? isFirstTime;
