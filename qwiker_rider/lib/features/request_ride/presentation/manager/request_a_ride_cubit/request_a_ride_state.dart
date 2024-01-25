part of 'request_a_ride_cubit.dart';

@immutable
sealed class RequestARideState {}

final class RequestARideInitial extends RequestARideState {}

final class RequestARideLoading extends RequestARideState {}

final class RequestARideLoaded extends RequestARideState {}

final class GetCurrentPositionLoading extends RequestARideState {}

final class GetCurrentPositionLoaded extends RequestARideState {}

final class GetCurrentPositionFaluer extends RequestARideState {
  final String message;

  GetCurrentPositionFaluer({required this.message});
}

final class TripRequested extends RequestARideState {}

final class DriverAccebted extends RequestARideState {}

final class DriverOnStart extends RequestARideState {}

final class TripStarted extends RequestARideState {}

final class OnDestination extends RequestARideState {}

final class TripEnded extends RequestARideState {}
