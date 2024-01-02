import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'confirm_ride_state.dart';

class ConfirmRideCubit extends Cubit<ConfirmRideState> {
  ConfirmRideCubit() : super(ConfirmRideInitial());

  void bookRide() {
    emit(ConfirmRideWaitingDriver());
  }
}
