import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';



class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository signupRepository;

  SignupBloc({this.signupRepository}) : super(SignupInitial()) {
    on<SignupRequested>(_onSignupRequested);
  }

  void _onSignupRequested(SignupRequested event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      await signupRepository.signup(
        username: event.username,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
      );
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}

