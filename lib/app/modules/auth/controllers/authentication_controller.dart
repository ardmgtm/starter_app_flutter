import 'package:get/get.dart';

import '../../../core/models/app_response.dart';
import '../models/user.dart';
import '../providers/authentication_provider.dart';

class AuthenticationController extends GetxController {
  final AuthenticationProvider authenticationProvider;

  final isLoading = false.obs;
  final isAuthenticated = false.obs;

  AuthenticationController({
    required this.authenticationProvider,
  });

  @override
  void onInit() async {
    super.onInit();
    checkAuth();
  }

  bool checkAuth() {
    isAuthenticated.value = authenticationProvider.isAuthenticated();
    return isAuthenticated.value;
  }

  Future<AppResponse<User>> login(String username, String password) async {
    isLoading.value = true;
    var resp = await authenticationProvider.login(username, password);
    checkAuth();
    isLoading.value = false;
    return resp;
  }

  Future<AppResponse<void>> logout() async {
    var resp = await authenticationProvider.logout();
    checkAuth();
    return resp;
  }
}
