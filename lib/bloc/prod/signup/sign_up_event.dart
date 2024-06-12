part of 'sign_up_bloc.dart';



@immutable
abstract class SignupEvent {}

class SignupRequested extends SignupEvent {
  final String username;
  final String password;
  final String firstName;
  final String lastName;

  SignupRequested({required this.username, required this.password, required this.firstName, required this.lastName});
}
