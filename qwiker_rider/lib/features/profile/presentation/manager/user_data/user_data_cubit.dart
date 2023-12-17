import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';
import 'package:qwiker_rider/features/profile/data/user_repo_imple.dart';

import '../../../../../core/exptions/error_handeler.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepoImple _userRepoImple;
  UserDataCubit(this._userRepoImple) : super(UserDataInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController extraPhoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addNewUser(UserModel user) async {
    emit(UserDataLoading());

    Either<Falure, Future<void>> result = await _userRepoImple.addNewUser(user);

    result.fold(
        (faluer) => emit(
              UserDataFalure(errorMessage: faluer.errorMessage),
            ),
        (success) => emit(UserDataSuccess()));
  }
}
