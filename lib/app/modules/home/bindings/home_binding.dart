import 'package:get/get.dart';

import '../../auth/controllers/authentication_controller.dart';
import '../controllers/bottom_navigation_bar_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(authenticationProvider: Get.find()),
    );
    Get.lazyPut<BottomNavigationBarController>(
      () => BottomNavigationBarController(),
    );
  }
}
