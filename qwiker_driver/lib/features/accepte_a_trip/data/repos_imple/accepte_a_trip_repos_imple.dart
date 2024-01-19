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
  Either<Falure, Future<void>> accepteAtrip(TripModel trip) {
    try {
      // _accepteAtripRemoteDataSource
      //     .deleteTripFromRequested(trip.riderData!.riderPhone);
      // Geolocator.getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.high,
      // ).then((position) {
      //   print(position.toString());
      //   driverLocationLat = position.altitude;
      //   driverLocationLong = position.longitude;
      //   print(driverLocationLat);
      // });

      _accepteAtripRemoteDataSource.addTripToOnGoing(trip);

      return right(_accepteAtripRemoteDataSource
          .notifyTheRider(trip.riderData!.riderPhone));
    } catch (e) {
      return left(Falure(errorMessage: e.toString()));
    }
  }
}
