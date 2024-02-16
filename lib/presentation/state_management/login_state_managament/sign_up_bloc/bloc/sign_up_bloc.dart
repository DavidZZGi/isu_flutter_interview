import 'package:bloc/bloc.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState(SignUpStatus.initial)) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
