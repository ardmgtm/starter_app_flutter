import 'package:get/get.dart';

import '../modules/auth/bindings/login_binding.dart';
import '../modules/auth/middlewares/authentication_middleware.dart';
import '../modules/auth/middlewares/guest_middleware.dart';
import '../modules/auth/providers/authentication_provider.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        middlewares: [
          Get.find<AuthenticationMiddleware>(),
        ]),
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding(),
        middlewares: [
          GuestMiddleware(
            authenticationProvider: Get.find<AuthenticationProvider>(),
          )
        ]),
  ];
}
