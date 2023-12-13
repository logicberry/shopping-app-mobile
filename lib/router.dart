import 'package:go_router/go_router.dart';

import 'src/core/core.dart';
import 'src/features/Authentication/register.dart';
import 'src/features/Authentication/signin.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
    GoRoute(
      name: RouteConstants.signIn,
      path: '/',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: RouteConstants.signUp,
      path: '/signUp',
      builder: (context, state) => const SignUpPage(),
    ),
  ]);
}
