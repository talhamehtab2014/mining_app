import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  bool isMineStarted = false;

  @override
  void onInit() {
    super.onInit();
    print("HomeViewModel initialized");
  }

  void startMining() {
    isMineStarted = true;
    update();
  }
}