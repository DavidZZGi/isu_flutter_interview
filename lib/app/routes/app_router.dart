import 'package:go_router/go_router.dart';
import 'package:isu_flutter_interview/presentation/screens/screens.dart';

// GoRouter configuration
class AppRouter {
// ignore: unused_field
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name:
            'signin', 
        path: '/',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: 'dashboard',
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        name: 'workticket',
        path: '/workticket',
        builder: (context, state) => const WorkTicketScreen(),
      ),
      GoRoute(
        name: 'getdirections',
        path: '/getdirections',
        builder: (context, state) => const GetDirectionScreen(),
      ),
    ],
  );
}
