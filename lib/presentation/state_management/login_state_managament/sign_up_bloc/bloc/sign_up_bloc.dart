import 'package:bloc/bloc.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:isu_flutter_interview/domain/modules/login_module/user_sign_up.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserSignUp userSignUp;
  SignUpBloc({required this.userSignUp})
      : super(SignUpState(SignUpStatus.initial)) {
    on<OnSignUp>(_onSignUp);
  }
  void _onSignUp(OnSignUp event, Emitter<SignUpState> emit) async {
    await userSignUp.call(event.user);
    emit(SignUpState(SignUpStatus.success));
  }
}
