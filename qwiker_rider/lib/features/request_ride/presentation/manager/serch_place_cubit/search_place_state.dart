part of 'search_place_cubit.dart';

@immutable
sealed class SearchPlaceState {}

final class SearchPlaceInitial extends SearchPlaceState {}

final class SearchPlaceLoading extends SearchPlaceState {}

final class SearchPlaceLoadedSuccess extends SearchPlaceState {}

final class SearchPlaceFaluer extends SearchPlaceState {
  final String message;

  SearchPlaceFaluer({required this.message});
}
