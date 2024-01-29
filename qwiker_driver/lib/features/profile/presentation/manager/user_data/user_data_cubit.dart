import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';
import 'package:qwiker_driver/features/profile/data/user_repo_imple.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/exptions/error_handeler.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepoImple _userRepoImple;
  UserDataCubit(this._userRepoImple) : super(UserDataInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String countryIsoCode = 'GH';

  PhoneNumber number = PhoneNumber(isoCode: 'GH');

  Future<void> addNewUser(DriverModel user) async {
    emit(UserDataLoading());

    Either<Falure, Future<void>> result = _userRepoImple.addNewUser(user);

    result.fold(
        (faluer) => emit(
              UserDataFalure(errorMessage: faluer.errorMessage),
            ), (success) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('hasProfile', true);
      emit(UserDataAddedSuccess());
    });
  }

  Future<void> getUserProfileData() async {
    emit(UserDataLoading());
    Either<Falure, Future<DriverModel>> result =
        _userRepoImple.getUserProfileData(getPhoneNumber());

    result.fold(
        (faluer) => emit(
              UserDataFalure(errorMessage: faluer.errorMessage),
            ), (user) async {
      final DriverModel userData = await user;
      String phoneNumber = getPhoneNumber();
      number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);

      emailController.text = userData.email ?? '';
      nameController.text = userData.driverName;
      phoneController.text = userData.driverPhoneNumber;
      emit(UserDataAddedSuccess());
    });
  }

  Future<void> updateUserProfileData(DriverModel user) async {
    emit(UserDataLoading());

    Either<Falure, Future<void>> result =
        _userRepoImple.updateUserProfileData(user);

    result.fold(
        (faluer) => emit(
              UserDataFalure(errorMessage: faluer.errorMessage),
            ), (success) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('hasProfile', true);
      emit(UserDataAddedSuccess());
    });
  }
}
