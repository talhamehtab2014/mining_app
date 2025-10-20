import 'package:get/get.dart';
import 'package:mining_application/src/core/utils/routes.dart';

class SplashViewModel extends GetxController {
  String title = "Splash View Model";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed(Routes().getOnboardingPage());
    });
  }
}
