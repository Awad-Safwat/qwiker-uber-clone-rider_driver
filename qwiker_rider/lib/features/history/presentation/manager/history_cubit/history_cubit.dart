import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/features/history/data/history_repo_imple.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({required this.historyRepoImple}) : super(HistoryInitial());
  final HistoryRepoImple historyRepoImple;
  List<TripModel> history = [];

  void getHistory(String phoneNumber) async {
    emit(HistoryLoading());
    var result = await historyRepoImple.getHistory(phoneNumber);
    result.fold((falure) {
      emit(HistoryFaluer(
        message: falure.errorMessage,
      ));
    }, (trips) {
      history = trips;
      emit(HistoryLoaded());
    });
  }
}
