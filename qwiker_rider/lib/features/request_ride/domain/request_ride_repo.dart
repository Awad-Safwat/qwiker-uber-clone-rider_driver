import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';

abstract class RequestRideRepo {
  Future<Either<Falure, Position>> getCurrentPosition();
  Future<Either<Falure, List<PlaceModel>>> searchForPlace(String? searchText);
  Either<Falure, Future<void>> bookATrip(TripModel? trip);
  Future<Either<Falure, Future<void>>> endAtrip(TripModel trip);
  Future<Either<Falure, Future<void>>> cancelTrip(String riderPhone);
}
