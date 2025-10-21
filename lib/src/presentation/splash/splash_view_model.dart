import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/utils/routes.dart';

class SplashViewModel extends GetxController {
  String title = AppStrings.title;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed(Routes().getOnboardingPage());
    });
  }
}
