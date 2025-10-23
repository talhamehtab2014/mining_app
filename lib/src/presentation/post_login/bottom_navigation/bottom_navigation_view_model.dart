import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationViewModel extends GetxController {
  int selectedIndex = 0;
  List<IconData> iconData = [
    Icons.home,
    Icons.trending_up,
    Icons.people_alt_outlined,
    Icons.history,
    Icons.settings,
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('BottomNavigationViewModel initialized');
  }

  void updateIndex(int index) {
    selectedIndex = index;
    update();
  }
}
