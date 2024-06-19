part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLogin extends AuthEvent {}

class AuthLogout extends AuthEvent {}

class AuthRegister extends AuthEvent {}

class AuthCheckLogin extends AuthEvent {}
