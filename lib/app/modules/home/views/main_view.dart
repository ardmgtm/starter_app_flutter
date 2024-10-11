import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

import '../controllers/home_controller.dart';
import 'components/app_bottom_navigation_bar.dart';
import 'components/app_drawer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Get.find<BottomNavigationBarController>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
              navigationItems[bottomNavigationController.currentIndex.value]
                  .label),
        ),
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
      drawer: const AppDrawer(),
      body: Obx(
        () => navigationItems[bottomNavigationController.currentIndex.value]
            .screen,
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
