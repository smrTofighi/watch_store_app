part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class AuthSendState extends AuthState {
  final String mobile;
  AuthSendState({required this.mobile});
}

final class AuthVerifiedIsRegisteredState extends AuthState {}

final class AuthVerifiedNotRegisteredState extends AuthState {}

final class AuthLoggedInState extends AuthState {}

final class AuthLoggedOutState extends AuthState {}
