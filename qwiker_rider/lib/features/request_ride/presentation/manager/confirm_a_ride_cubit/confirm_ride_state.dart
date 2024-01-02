part of 'confirm_ride_cubit.dart';

@immutable
sealed class ConfirmRideState {}

final class ConfirmRideInitial extends ConfirmRideState {}

final class ConfirmRideLoading extends ConfirmRideState {}

final class ConfirmRideFaluer extends ConfirmRideState {
  final String message;

  ConfirmRideFaluer({required this.message});
}

final class ConfirmRideConfirmed extends ConfirmRideState {}

final class ConfirmRideCanceled extends ConfirmRideState {}

final class ConfirmRideWaitingDriver extends ConfirmRideState {}
