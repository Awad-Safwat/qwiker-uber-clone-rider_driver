part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryLoaded extends HistoryState {}

final class HistoryFaluer extends HistoryState {
  final String message;

  HistoryFaluer({required this.message});
}
