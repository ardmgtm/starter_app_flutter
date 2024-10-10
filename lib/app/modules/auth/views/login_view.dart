import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/granule_button.dart';
import '../../../widgets/granule_textfield.dart';
import '../controllers/authentication_controller.dart';

class LoginView extends GetView<AuthenticationController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameInputController = TextEditingController();
    TextEditingController passwordInputController = TextEditingController();

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
                          controller: usernameInputController,
                        ),
                        const SizedBox(height: 8),
                        GranuleTextfield(
                          label: "Password",
                          obscureText: true,
                          placeholder: "Masukkan Password",
                          controller: passwordInputController,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: Obx(
                            () => Granulebutton(
                              text: "Login",
                              loading: controller.isLoading.value,
                              onTap: () async {
                                var resp = await controller.login(
                                  usernameInputController.text,
                                  passwordInputController.text,
                                );
                                if (resp.success) {
                                  Get.offAllNamed(Routes.HOME);
                                } else {
                                  Get.snackbar("Status", resp.message ?? "");
                                }
                              },
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
