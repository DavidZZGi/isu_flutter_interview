import 'package:go_router/go_router.dart';
import 'package:isu_flutter_interview/presentation/screens/screens.dart';

import '../../data/models/ticket.dart';

// GoRouter configuration
class AppRouter {
// ignore: unused_field
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'signin',
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
          builder: (context, state) {
            final ticket = state.extra as Ticket;
            return WorkTicketScreen(ticket: ticket);
          }),
      GoRoute(
        name: 'getdirections',
        path: '/getdirections',
        builder: (context, state) =>
            GetDirectionScreen(address: state.extra.toString()),
      ),
    ],
  );
}
