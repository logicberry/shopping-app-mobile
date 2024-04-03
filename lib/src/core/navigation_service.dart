import 'package:go_router/go_router.dart';

class NavigationService {
  final GoRouter _router;

  NavigationService(this._router);

  void navigateTo(String routeName) {
    _router.pushNamed(routeName);
  }

  void goBack() {
    _router.pop();
  }
}
