import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_event.dart';
part 'get_state.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  GetBloc() : super(GetInitial()) {
    on<GetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
