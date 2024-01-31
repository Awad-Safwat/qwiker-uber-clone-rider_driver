import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';

abstract class HistoryRepo {
  Future<Either<Falure, List<TripModel>>> getHistory(String phoneNumber);
}
