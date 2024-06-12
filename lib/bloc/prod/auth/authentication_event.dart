part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class LoginRequested extends AuthenticationEvent {
  final String username;
  final String password;

  LoginRequested({required this.username, required this.password});
}