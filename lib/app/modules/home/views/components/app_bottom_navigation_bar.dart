import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../auth/views/account_view.dart';
import '../../controllers/bottom_navigation_bar_controller.dart';
import '../dashboard_view.dart';

class NavigationItem {
  final Widget icon;
  final String label;
  final Widget screen;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}

final navigationItems = [
  NavigationItem(
    icon: const HeroIcon(HeroIcons.home),
    label: "Dashboard",
    screen: const DashboardView(),
  ),
  NavigationItem(
    icon: const HeroIcon(HeroIcons.creditCard),
    label: "Transaction",
    screen: const Center(
      child: Text("Transaction"),
    ),
  ),
  NavigationItem(
    icon: const HeroIcon(HeroIcons.userCircle),
    label: "Account",
    screen: const AccountView(),
  ),
];

class AppBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        onTap: controller.switchPage,
        currentIndex: controller.currentIndex.value,
        items: navigationItems.map<BottomNavigationBarItem>((navigationItem) {
          return BottomNavigationBarItem(
            icon: navigationItem.icon,
            label: navigationItem.label,
          );
        }).toList(),
      ),
    );
  }
}
