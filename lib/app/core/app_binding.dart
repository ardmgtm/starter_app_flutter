import 'package:get/get.dart';

import '../modules/auth/middlewares/authentication_middleware.dart';
import '../modules/auth/providers/authentication_provider.dart';
import 'services/shared_preference_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SharedPreferenceService>(SharedPreferenceService());
    Get.lazyPut<AuthenticationProvider>(
      () => AuthenticationDummyProvider(sharedPreferenceService: Get.find()),
    );
    Get.lazyPut(
      () => AuthenticationMiddleware(authenticationProvider: Get.find()),
    );
  }
}
