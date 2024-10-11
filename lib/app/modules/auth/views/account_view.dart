import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/granule_button.dart';
import '../controllers/authentication_controller.dart';

class AccountView extends GetView<AuthenticationController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/avatar-default.png"),
              ),
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 32),
          Granulebutton(
            text: "Logout",
            color: Colors.red,
            onTap: controller.logout,
          )
        ],
      ),
    );
  }
}
