import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';

abstract class HistoryRepo {
  Future<Either<Falure, List<TripModel>>> getHistory(String phoneNumber);
}
