part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  // NOTE:May use in future
  // final String token;
  // AuthLoaded({required this.token});
}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
