import 'package:bloc/bloc.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState(SignInStatus.initial)) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
