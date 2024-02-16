part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class OnSignIn extends SignInEvent {
  final User user;

  OnSignIn({required this.user});
}
