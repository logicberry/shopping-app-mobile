import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/features/Cart/model/cart_model.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';
import 'package:shopapp/src/features/Profile/screens/change_password_page.dart';
import 'package:shopapp/src/features/home/screens/products_screen.dart';
import 'package:shopapp/src/features/home/screens/promotions_page.dart';

import 'src/components/bottom_nav.dart';
import 'src/core/core.dart';
import 'src/features/Authentication/screens/views.dart';
import 'src/features/Cart/screens/cart_page.dart';
import 'src/features/Checkout/screens/checkout_page.dart';
import 'src/features/Notification/screens/notifications_page.dart';
import 'src/features/Product/screens/product_details_page.dart';
import 'src/features/Profile/model/user_model.dart';
import 'src/features/Profile/screens/edit_profile_page.dart';
import 'src/features/Profile/screens/theme_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
      initialLocation: '/signIn',
      routes: [
        GoRoute(
          name: RouteConstants.signIn,
          path: '/signIn',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignInPage());
          },
        ),
        GoRoute(
          name: RouteConstants.signUp,
          path: '/signUp',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignUpPage());
          },
        ),
        GoRoute(
          name: RouteConstants.promotions,
          path: '/promotion',
          pageBuilder: (context, state) {
            return const MaterialPage(child: PromotionsPage());
          },
        ),
        GoRoute(
          name: RouteConstants.nav,
          path: '/nav',
          pageBuilder: (context, state) {
            return const MaterialPage(child: NavBar());
          },
        ),
        GoRoute(
          name: RouteConstants.productDetails,
          path: '/pde',
          pageBuilder: (context, state) {
            ProductModel product = state.extra as ProductModel;
            return MaterialPage(child: ProductDetailsPage(product: product));
          },
        ),
        GoRoute(
          name: RouteConstants.allProducts,
          path: '/allProducts/:categoryId',
          pageBuilder: (context, state) {
            return MaterialPage(
                child: ProductPage(
              categoryId: state.pathParameters['categoryId'],
            ));
          },
        ),
        GoRoute(
          name: RouteConstants.cart,
          path: '/cart',
          pageBuilder: (context, state) {
            return const MaterialPage(child: CartPage());
          },
        ),
        GoRoute(
          name: RouteConstants.checkOut,
          path: '/checkOut',
          pageBuilder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return MaterialPage(
                child: CheckOutPage(
              products: data['a'] as List<CartModel>,
              totalPrice: data['b'] as double,
            ));
          },
        ),
        GoRoute(
          name: RouteConstants.editProfile,
          path: '/editProfile',
          pageBuilder: (context, state) {
            UserModel user = state.extra as UserModel;
            return MaterialPage(child: EditProfilePage(user: user));
          },
        ),
        GoRoute(
          name: RouteConstants.theme,
          path: '/theme',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ThemePage());
          },
        ),
        GoRoute(
          name: RouteConstants.changePassword,
          path: '/changePassword',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ChangePasswordPage());
          },
        ),
        GoRoute(
          name: RouteConstants.notification,
          path: '/notification',
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
