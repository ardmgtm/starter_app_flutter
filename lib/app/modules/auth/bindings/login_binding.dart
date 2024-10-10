import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(authenticationProvider: Get.find()),
    );
  }
}
