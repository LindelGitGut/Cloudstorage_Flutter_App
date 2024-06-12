import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../repo/LoginRepository.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository loginRepository = LoginRepository();

  AuthenticationBloc() : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthenticationState> emit) async {
    emit(LoginLoading());
    try {
      await loginRepository.login(
        username: event.username,
        password: event.password,
      );
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
