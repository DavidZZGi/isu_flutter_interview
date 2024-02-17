import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isu_flutter_interview/app/routes/app_router.dart';
import 'package:isu_flutter_interview/data/local_db/database_helper.dart';
import 'package:isu_flutter_interview/domain/modules/login_module/user_sign_in.dart';
import 'package:isu_flutter_interview/domain/modules/login_module/user_sign_up.dart';
import 'package:isu_flutter_interview/domain/repositories/user_repository.dart';
import 'package:isu_flutter_interview/presentation/state_management/login_state_managament/sign_in_bloc/bloc/sign_in_bloc.dart';

import 'presentation/state_management/login_state_managament/sign_up_bloc/bloc/sign_up_bloc.dart';

void main() async {
  runApp(const MyApp());
  await DatabaseHelper().initDatabase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(
              userSignIn:
                  UserSignIn(userRepository: UserRepository(DatabaseHelper()))),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
              userSignUp:
                  UserSignUp(userRepository: UserRepository(DatabaseHelper()))),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'ISU Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
      ),
    );
  }
}
