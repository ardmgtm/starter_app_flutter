import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/app_response.dart';
import '../../../routes/app_pages.dart';
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

    if (resp.success) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar(
        "Status",
        resp.message ?? "",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(32),
      );
    }
    isLoading.value = false;
    return resp;
  }

  void logout() async {
    var resp = await authenticationProvider.logout();
    checkAuth();
    if (resp.success) Get.offAllNamed(Routes.LOGIN);
  }
}
