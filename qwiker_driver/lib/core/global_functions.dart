// check first time or not to show onboarding screen
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';
import 'package:qwiker_driver/features/messages/presentation/views/messages_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
bool? isFirstTime;

// check the user profile
bool? hasProfile;

bool? checkFirstSeen() {
  bool isFirstT = (prefs.getBool('seen') ?? true);

  if (isFirstT) {
    prefs.setBool('seen', false);
    //is first time
    return true;
  } else {
    //not the first time
    return false;
  }
}

bool? checkUserProfile() {
  return prefs.getBool('hasProfile') ?? false;
}

// save phone number localy

void savePhoneLocal(String phoneNumber) async {
  prefs.setString('phoneNumber', phoneNumber);
}

void saveUserDataLocal(DriverModel driver) {
  prefs.setString('driverName', driver.driverName);
  prefs.setString('driverEmail', driver.email ?? '');
}

DriverModel getUserData() {
  DriverModel driver = DriverModel(
    driverPhoneNumber: prefs.getString('phoneNumber').toString(),
    email: prefs.getString('driverEmail').toString(),
    driverName: prefs.getString('driverName').toString(),
  );

  return driver;
}

String getPhoneNumber() {
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

void showMessagesView(BuildContext context) => showAdaptiveDialog(
    context: context,
    builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 70.h),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.mainBlue,
              ),
              clipBehavior: Clip.hardEdge,
              child: const MessagesView()),
        ));
