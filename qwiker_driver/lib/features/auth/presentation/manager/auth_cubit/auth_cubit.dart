import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/features/auth/data/auth_repo_imple.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required authRepoImple})
      : _authRepoImple = authRepoImple,
        super(AuthInitial());

  final AuthRepoImple _authRepoImple;

  late String verificationId;
  String? phoneNumber;
  String? userPinCode;
  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(AuthLoading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void getUserProfileData(String userId) async {
    emit(AuthLoading());
    var result = _authRepoImple.getUserProfileData(userId);

    result.fold((falure) {
      emit(AuthFailer(message: falure.errorMessage));
    }, (riderData) async {
      var rider = await riderData;
      if (rider != null) {
        prefs.setBool('hasProfile', true);
        saveUserDataLocal(rider);
        emit(AuthUserExiste());
      } else {
        emit(AuthUserNotExiste());
      }
    });
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    // print('verificationCompleted');
    // await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(AuthFailer(message: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(AuthCodeSent());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    emit(AuthLoading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthFailer(message: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
