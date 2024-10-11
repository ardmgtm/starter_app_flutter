import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../routes/app_pages.dart';
import '../../auth/controllers/authentication_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starter App"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Image.asset('assets/images/logo-white.png'),
            ),
            ListTile(
              leading: const HeroIcon(HeroIcons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const HeroIcon(HeroIcons.arrowLeftStartOnRectangle),
              title: const Text('Logout'),
              onTap: () async {
                Navigator.pop(context);
                var authController = Get.find<AuthenticationController>();
                var resp = await authController.logout();
                if (resp.success) {
                  Get.offAllNamed(Routes.LOGIN);
                }
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Hello"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(
              HeroIcons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.creditCard),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.userCircle),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
