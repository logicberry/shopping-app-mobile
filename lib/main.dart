import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/router.dart';
import 'package:shopapp/src/app.dart';

import 'src/core/core.dart';
import 'src/features/Profile/controller/theme_controller.dart';
import 'src/services/locator_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    const ShopApp(child: MyApp()),
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
          SystemUiManager.setSystemUiOverlayStyle(context);
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
