import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>(_onLogin);
    on<AuthLogout>((event, emit) {});
    on<AuthRegister>((event, emit) {});
    on<AuthCheckLogin>((event, emit) {});
  }

  void _onLogin(AuthLogin event, Emitter<AuthState> emit) {
    emit(AuthLoaded());
    try {
      emit(AuthLoaded());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
