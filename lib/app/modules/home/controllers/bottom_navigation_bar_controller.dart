import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  final currentIndex = 0.obs;

  void switchPage(int index) {
    currentIndex.value = index;
  }
}
