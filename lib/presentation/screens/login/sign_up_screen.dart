import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isu_flutter_interview/data/models/user.dart';
import 'package:isu_flutter_interview/presentation/state_management/login_state_managament/sign_up_bloc/bloc/sign_up_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../widgets/flutter_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool _showPassword = true;
  bool _repeatShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text('Sign Up'),
      ),
      backgroundColor: Colors.white,
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.signUpStatus == SignUpStatus.success) {
            toastification.show(
              closeOnClick: true,
              dragToClose: true,
              showProgressBar: false,
              context: context,
              type: ToastificationType.success,
              style: ToastificationStyle.flat,
              autoCloseDuration: const Duration(seconds: 2),
              title: const Text('Created account'),
              description: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: 'Your account have been created successfully')),
              alignment: Alignment.topRight,
              direction: TextDirection.ltr,
            );

            Future.delayed(const Duration(seconds: 3), () => context.go('/'));
          }
        },
        child: SingleChildScrollView(
          child: Column(children: [
            const FlutterFormIcon(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email or Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _repeatPasswordController,
                    obscureText: _repeatShowPassword,
                    decoration: InputDecoration(
                      labelText: 'Repeat Password',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _repeatShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _repeatShowPassword = !_repeatShowPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  FilledButton(
                    child: const Text('Sign up'),
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final repeatPassword = _repeatPasswordController.text;
                      if (password != repeatPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                          ),
                        );
                        return;
                      }

                      if (email.isNotEmpty && password.isNotEmpty) {
                        context.read<SignUpBloc>().add(OnSignUp(
                            user: User(username: email, password: password)));
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Already have an account'),
                  const SizedBox(height: 5),
                  TextButton(
                      child: const Text('Sign In'),
                      onPressed: () => context.go('/'))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
