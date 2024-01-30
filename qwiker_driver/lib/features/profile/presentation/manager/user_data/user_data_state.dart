part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataAddedSuccess extends UserDataState {}

final class UserDataFalure extends UserDataState {
  final String errorMessage;

  UserDataFalure({required this.errorMessage});
}
