import 'package:go_router/go_router.dart';

import 'src/core/core.dart';
import 'src/features/Authentication/signup.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
    GoRoute(
      name: RouteConstants.signUp,
      path: '/',
      builder: (context, state) => const SignUpPage(),
    ),
  ]);
}
