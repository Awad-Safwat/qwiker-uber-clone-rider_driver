import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/history/data/history_data_source.dart';
import 'package:qwiker_rider/features/history/domain/history_repo.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';

class HistoryRepoImple implements HistoryRepo {
  final HistoryDataSource _historyDataSource;

  HistoryRepoImple({required HistoryDataSource historyDataSource})
      : _historyDataSource = historyDataSource;
  @override
  Future<Either<Falure, List<TripModel>>> getHistory(String phoneNumber) async {
    try {
      List<TripModel> trips = await _historyDataSource.getHistory(phoneNumber);
      return right(trips);
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }
}
