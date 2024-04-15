import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/Authentication/controller/auth_controller.dart';
import 'features/Cart/controller/cart_controller.dart';
import 'features/Cart/controller/selected_item_controller.dart';
import 'features/Product/controller/product_controller.dart';
import 'features/Profile/controller/theme_controller.dart';
import 'features/Profile/controller/user_controller.dart';


class ShopApp extends StatelessWidget {
  const ShopApp({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => SelectedItemsProvider()),
      ],
      child: child,
    );
  }
}
