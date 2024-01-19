import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';

abstract class AccepteAtripRepos {
  Either<Falure, Future<void>> accepteAtrip(TripModel trip);
}
