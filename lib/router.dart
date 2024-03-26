import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/features/home/screens/products_screen.dart';

import 'src/components/bottom_nav.dart';
import 'src/core/core.dart';
import 'src/features/Authentication/screens/views.dart';
import 'src/features/Cart/screens/cart_page.dart';
import 'src/features/Checkout/screens/checkout_page.dart';
import 'src/features/Notification/screens/notifications_page.dart';
import 'src/features/Product/screens/product_details_page.dart';
import 'src/features/Profile/screens/edit_profile_page.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GoRouter router = GoRouter(
      // navigatorKey: navigatorKey,
      initialLocation: RouteConstants.signIn,
      routes: [
        GoRoute(
          name: RouteConstants.signIn,
          path: RouteConstants.signIn,
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignInPage());
          },
        ),
        GoRoute(
          name: RouteConstants.signUp,
          path: RouteConstants.signUp,
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignUpPage());
          },
        ),
        GoRoute(
          name: RouteConstants.nav,
          path: RouteConstants.nav,
          pageBuilder: (context, state) {
            return const MaterialPage(child: NavBar());
          },
        ),
        GoRoute(
          name: RouteConstants.productDetails,
          path: RouteConstants.productDetails,
          pageBuilder: (context, state) {
            return const MaterialPage(child: ProductDetailsPage());
          },
        ),
        GoRoute(
          name: RouteConstants.allProducts,
          path: RouteConstants.allProducts,
          pageBuilder: (context, state) {
            return const MaterialPage(child: ProductPage());
          },
        ),
        GoRoute(
          name: RouteConstants.cart,
          path: RouteConstants.cart,
          pageBuilder: (context, state) {
            return const MaterialPage(child: CartPage());
          },
        ),
        GoRoute(
          name: RouteConstants.checkOut,
          path: RouteConstants.checkOut,
          pageBuilder: (context, state) {
            return const MaterialPage(child: CheckOutPage());
          },
        ),
        GoRoute(
          name: RouteConstants.editProfile,
          path: RouteConstants.editProfile,
          pageBuilder: (context, state) {
            return const MaterialPage(child: EditProfilePage());
          },
        ),
        GoRoute(
          name: RouteConstants.notification,
          path: RouteConstants.notification,
          pageBuilder: (context, state) {
            return const MaterialPage(child: NotificationsPage());
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text('ERROR 404'),
          ),
        ));
      });
}
