part of 'reviewes_cubit.dart';

@immutable
sealed class ReviewesState {}

final class ReviewesInitial extends ReviewesState {}

final class ReviewesLoading extends ReviewesState {}

final class ReviewesLoaded extends ReviewesState {}

final class ReviewesFaluer extends ReviewesState {
  final String message;

  ReviewesFaluer({required this.message});
}
