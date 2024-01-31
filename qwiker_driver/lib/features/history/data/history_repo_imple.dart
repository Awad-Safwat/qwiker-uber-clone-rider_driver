import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';
import 'package:qwiker_driver/features/history/data/history_data_source.dart';
import 'package:qwiker_driver/features/history/domain/history_repo.dart';

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
