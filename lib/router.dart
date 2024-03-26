import 'package:go_router/go_router.dart';
import 'package:shopapp/src/components/bottom_nav.dart';
import 'package:shopapp/src/features/Authentication/screens/screens.dart';
import 'src/core/core.dart';
import 'src/features/home/home.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: RouteConstants.signIn,
      path: '/',
      builder: (context, state) => const NavBar(current: 0),
    ),
    GoRoute(
      name: RouteConstants.signUp,
      path: '/signUp',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: RouteConstants.nav,
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ]);
}
