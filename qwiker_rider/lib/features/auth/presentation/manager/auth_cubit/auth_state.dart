part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailer extends AuthState {
  final String message;

  AuthFailer({required this.message});
}

final class AuthSuccess extends AuthState {}

final class AuthCodeSent extends AuthState {}

final class AuthSendingCode extends AuthState {}

final class AuthSendingCodeFalier extends AuthState {
  final String message;

  AuthSendingCodeFalier({required this.message});
}
