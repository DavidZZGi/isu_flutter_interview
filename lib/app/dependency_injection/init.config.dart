import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:isu_flutter_interview/data/local_db/database_helper.dart';
import 'package:isu_flutter_interview/data/services/ticket_services.dart';
import 'package:isu_flutter_interview/data/services/user_services.dart';
import 'package:isu_flutter_interview/domain/modules/login_module/user_sign_in.dart';
import 'package:isu_flutter_interview/domain/modules/login_module/user_sign_up.dart';
import 'package:isu_flutter_interview/domain/repositories/ticket_repository.dart';
import 'package:isu_flutter_interview/domain/repositories/user_repository.dart';
import 'package:isu_flutter_interview/presentation/state_management/login_state_managament/sign_in_bloc/bloc/sign_in_bloc.dart';
import 'package:isu_flutter_interview/presentation/state_management/login_state_managament/sign_up_bloc/bloc/sign_up_bloc.dart';

FutureOr<void> initCore(GetIt sl) async {
  final sqliteInstance = DatabaseHelper.instance;
  sl
    ..registerLazySingleton<IUserServices>(
      () => UserRepository(sqliteInstance),
    )
    ..registerLazySingleton<ITicketService>(
      () => TicketRepository(
        sqliteInstance,
      ),
    )
    ..registerLazySingleton<UserSignIn>(
      () => UserSignIn(
        userRepository: sl<UserRepository>(),
      ),
    )
    ..registerLazySingleton<UserSignUp>(
      () => UserSignUp(userRepository: sl<UserRepository>()),
    )
    ..registerLazySingleton<SignInBloc>(
      () => SignInBloc(userSignIn: sl<UserSignIn>()),
    )
    ..registerLazySingleton<SignUpBloc>(
      () => SignUpBloc(userSignUp: sl<UserSignUp>()),
    );
}
