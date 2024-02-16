part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class OnSignUp extends SignUpEvent {
  final User user;
  OnSignUp({required this.user});
}
