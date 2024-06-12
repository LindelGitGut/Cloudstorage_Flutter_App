part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}



class LoginInitial extends AuthenticationState {}

class LoginLoading extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class LoginFailure extends AuthenticationState {
  final String error;

  LoginFailure(this.error);
}
