import 'package:geolocator/geolocator.dart';

import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/data_sources/remote_data_source.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/domain/repos/accepte_a_trip_repo.dart';

class AccepteAtripReposImple extends AccepteAtripRepos {
  final AccepteAtripRemoteDataSource _accepteAtripRemoteDataSource;

  AccepteAtripReposImple(
      {required AccepteAtripRemoteDataSource accepteAtripRemoteDataSource})
      : _accepteAtripRemoteDataSource = accepteAtripRemoteDataSource;

  late TripModel? currentTrip;

  @override
  Future<Either<Falure, Future<void>>> accepteAtrip(TripModel trip) async {
    try {
      await _accepteAtripRemoteDataSource
          .deleteTripFromRequested(trip.riderData!.riderPhone);
      trip.tripStates = 'DriverOnTheWay';
      return right(_accepteAtripRemoteDataSource.addTripToOnGoing(trip));
    } catch (e) {
      return left(Falure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Falure, Future<void>>> endAtrip(TripModel trip) async {
    try {
      await _accepteAtripRemoteDataSource
          .deleteTripFromOnGoing(trip.riderData!.riderPhone);
      return right(
          _accepteAtripRemoteDataSource.addTripToOnDriverHistory(trip));
    } catch (e) {
      return left(Falure(errorMessage: e.toString()));
    }
  }
}
