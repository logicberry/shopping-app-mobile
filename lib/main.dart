import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/router.dart';
import 'package:shopapp/src/features/Authentication/controller/auth_controller.dart';
import 'package:shopapp/src/features/Cart/controller/cart_controller.dart';
import 'package:shopapp/src/features/Product/controller/product_controller.dart';
import 'package:shopapp/src/features/Profile/controller/user_controller.dart';
import 'src/features/Profile/controller/theme_controller.dart';
import 'src/services/locator_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider())
    ], child: const MyApp()),
  );
}

final _router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (ctx, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Shopapp',
                theme: context.watch<ThemeProvider>().currentTheme,
                routerConfig: _router.router),
          );
        });
  }
}
