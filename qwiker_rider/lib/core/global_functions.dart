// check first time or not to show onboarding screen
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/features/messages/presentation/views/messages_view.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
bool? isFirstTime;

// check the user profile
bool? hasProfile;
RiderModel localRiderData = getUserData();

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

void saveUserDataLocal(RiderModel rider) {
  prefs.setString('riderName', rider.riderName);
  prefs.setString('riderEmail', rider.email);
  prefs.setString('extraPhoneNumber', rider.extraPhoneNumber ?? '');
}

RiderModel getUserData() {
  RiderModel rider = RiderModel(
    riderPhone: prefs.getString('phoneNumber').toString(),
    email: prefs.getString('riderEmail').toString(),
    riderName: prefs.getString('riderName').toString(),
    extraPhoneNumber: prefs.getString('extraPhoneNumber').toString(),
  );

  return rider;
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
