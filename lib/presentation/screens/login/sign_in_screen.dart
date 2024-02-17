import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:isu_flutter_interview/presentation/state_management/login_state_managament/sign_in_bloc/bloc/sign_in_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../widgets/flutter_icon.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonDisabled =
          _emailController.text.isEmpty || _passwordController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Welcome")),
      ),
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.signInStatus == SignInStatus.error) {
            toastification.show(
              context: context,
              type: ToastificationType.error,
              style: ToastificationStyle.flat,
              autoCloseDuration: const Duration(seconds: 2),
              title: const Text('Invalid Credentials'),
              description: RichText(
                  text: const TextSpan(
                      text: 'Your username or password are wrong')),
              alignment: Alignment.topRight,
              direction: TextDirection.ltr,
              animationDuration: const Duration(milliseconds: 300),
              animationBuilder: (context, animation, alignment, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
            _emailController.clear();
            _passwordController.clear();
          }
          if (state.signInStatus == SignInStatus.success) {
            Future.delayed(const Duration(seconds: 2), () {
              toastification.show(
                context: context,
                type: ToastificationType.success,
                style: ToastificationStyle.flat,
                autoCloseDuration: const Duration(seconds: 2),
                title: const Text('Correct Credentials'),
                description: RichText(
                    text: const TextSpan(
                        text: 'Your username and password are correct')),
                alignment: Alignment.topRight,
                direction: TextDirection.ltr,
                animationDuration: const Duration(milliseconds: 300),
                animationBuilder: (context, animation, alignment, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            });

            context.go('/dashboard');
          }
          if (state.signInStatus == SignInStatus.newUserError) {
            toastification.show(
              context: context,
              type: ToastificationType.error,
              style: ToastificationStyle.flat,
              autoCloseDuration: const Duration(seconds: 2),
              title: const Text('You are not registered'),
              description: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: 'Please sign up if you do not have an account')),
              alignment: Alignment.topRight,
              direction: TextDirection.ltr,
              animationDuration: const Duration(milliseconds: 300),
              animationBuilder: (context, animation, alignment, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
            _emailController.clear();
            _passwordController.clear();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const FlutterFormIcon(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Password',
                      hintText: 'Enter a secure password'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 9, 15, 20),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: _isButtonDisabled
                        ? null
                        : () {
                            context.read<SignInBloc>().add(OnSignIn(
                                user: User(
                                    username: _emailController.text,
                                    password: _passwordController.text)));
                          },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'New user? ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go('/signup');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
