import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isu_flutter_interview/app/routes/app_router.dart';
import 'package:isu_flutter_interview/presentation/state_management/login_state_managament/sign_in_bloc/bloc/sign_in_bloc.dart';
import 'package:isu_flutter_interview/presentation/state_management/ticket_bloc/bloc/ticket_bloc.dart';
import 'app/dependency_injection/init.config.dart';
import 'presentation/state_management/login_state_managament/sign_up_bloc/bloc/sign_up_bloc.dart';

GetIt sl = GetIt.I;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCore(sl);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SignInBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SignUpBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<TicketBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
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
