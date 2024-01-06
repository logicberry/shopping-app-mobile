import 'package:go_router/go_router.dart';
import 'package:shopapp/src/features/home/screens/products_screen.dart';

import 'src/core/core.dart';
import 'src/features/Authentication/register.dart';
import 'src/features/home/home.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: RouteConstants.signIn,
      path: '/',
      builder: (context, state) => const ProductPage(),
    ),
    GoRoute(
      name: RouteConstants.signUp,
      path: '/signUp',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: RouteConstants.home,
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ]);
}
