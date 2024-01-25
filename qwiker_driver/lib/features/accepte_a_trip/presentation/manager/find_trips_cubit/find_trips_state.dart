part of 'find_trips_cubit.dart';

sealed class FindTripsState {}

class FindTripsInitial extends FindTripsState {}

final class FindTripsNoTripsFounded extends FindTripsState {}

final class FindTripsNewTripsAdded extends FindTripsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> trips;

  FindTripsNewTripsAdded({required this.trips});
}

final class FindTripsFalure extends FindTripsState {
  final String message;

  FindTripsFalure({required this.message});
}

final class TripAccepted extends FindTripsState {}
