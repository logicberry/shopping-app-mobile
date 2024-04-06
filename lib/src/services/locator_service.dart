import 'package:get_it/get_it.dart';

import '../features/Authentication/controller/auth_controller.dart';
import '../features/Authentication/repository/auth_repository.dart';
import '../features/Product/controller/product_controller.dart';
import '../features/Product/repository/product_repository.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  locator.registerLazySingleton<ProductRepository>(() => ProductRepository());
  locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
  locator.registerLazySingleton<ProductProvider>(() => ProductProvider());
}
