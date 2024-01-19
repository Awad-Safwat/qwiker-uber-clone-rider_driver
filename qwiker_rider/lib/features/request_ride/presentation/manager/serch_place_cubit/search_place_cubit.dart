import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/request_ride_repo_imple/request_ride_repo_imple.dart';

part 'search_place_state.dart';

class SearchPlaceCubit extends Cubit<SearchPlaceState> {
  SearchPlaceCubit({required requestRideRepoImple})
      : _requestRideRepoImple = requestRideRepoImple,
        super(SearchPlaceInitial());
  final RequestRideRepoImple _requestRideRepoImple;
  TextEditingController startPointController = TextEditingController();
  TextEditingController endPointController = TextEditingController();
  bool isDestination = false;

  List<PlaceModel> placesFounded = [];

  void emitPlaceSelected() {
    emit(SearchPlaceInitial());
  }

  void searchForPlace(String searchText) async {
    emit(SearchPlaceLoading());
    var result = await _requestRideRepoImple.searchForPlace(searchText);

    result.fold((error) {
      emit(SearchPlaceFaluer(message: error.errorMessage));
    }, (places) {
      placesFounded = places;
      print(places);
      emit(SearchPlaceLoadedSuccess());
    });
  }
}
