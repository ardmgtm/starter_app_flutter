import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/granule_button.dart';
import '../../../widgets/granule_textfield.dart';
import '../controllers/authentication_controller.dart';

class LoginView extends GetView<AuthenticationController> {
  final TextEditingController _usernameInputController =
      TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();

  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  LoginView({super.key});

  void loginAction() async {
    var resp = await controller.login(
      _usernameInputController.text,
      _passwordInputController.text,
    );
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
  }

  @override
  Widget build(BuildContext context) {
    _usernameNode.requestFocus();

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.cyan,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    scale: 2,
                    image: AssetImage("assets/images/pkt-pattern.png"),
                  ),
                ),
              ),
            ],
          ),
          ListView(
            children: [
              const SizedBox(height: 56),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        GranuleTextfield(
                          label: "Username",
                          placeholder: "Masukkan username atau NPK",
                          controller: _usernameInputController,
                          focusNode: _usernameNode,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 8),
                        GranuleTextfield(
                          label: "Password",
                          obscureText: true,
                          placeholder: "Masukkan Password",
                          controller: _passwordInputController,
                          focusNode: _passwordNode,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => loginAction(),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: Obx(
                            () => Granulebutton(
                              text: "Login",
                              loading: controller.isLoading.value,
                              onTap: loginAction,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
