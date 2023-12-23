// check first time or not to show onboarding screen
import 'package:flutter/material.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
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

// check the user profile
bool? hasProfile;
Future<bool>? checkUserProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('hasProfile') ?? false;
}

// save phone number localy

void savePhoneLocal(String phoneNumber) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('phoneNumber', phoneNumber);
}

Future<String> getPhoneNumber() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('phoneNumber').toString();
}

// loading progress indicator
showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
