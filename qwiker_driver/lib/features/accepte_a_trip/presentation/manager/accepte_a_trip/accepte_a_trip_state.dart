part of 'accepte_a_trip_cubit.dart';

@immutable
sealed class AccepteATripState {}

final class AccepteATripInitial extends AccepteATripState {}

final class AccepteATripLoading extends AccepteATripState {}

final class AcceptATripFailure extends AccepteATripState {
  final String message;

  AcceptATripFailure({required this.message});
}

final class AcceptedTripSuccess extends AccepteATripState {}

final class DriverOnStartPoint extends AccepteATripState {}

final class LoadingRoutes extends AccepteATripState {}

final class LoadedRoutes extends AccepteATripState {}

final class GoingToRiderLocation extends AccepteATripState {}

final class TripIsStarted extends AccepteATripState {}

final class TripIsCanceld extends AccepteATripState {}
