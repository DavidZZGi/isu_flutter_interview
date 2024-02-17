import 'package:bloc/bloc.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/modules/login_module/user_sign_in.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserSignIn userSignIn;
  SignInBloc({required this.userSignIn})
      : super(SignInState(SignInStatus.initial)) {
    on<OnSignIn>(_onSignIn);
  }
  void _onSignIn(OnSignIn event, Emitter<SignInState> emit) async {
    final isRegistered = await userSignIn.checkUserAccount(event.user.username);
    if (!isRegistered) {
      emit(SignInState(SignInStatus.newUserError));
    } else {
      final result = await userSignIn.call(event.user);
      if (result) {
        emit(SignInState(SignInStatus.success));
      } else {
        emit(SignInState(SignInStatus.error));
      }
    }
  }
}
