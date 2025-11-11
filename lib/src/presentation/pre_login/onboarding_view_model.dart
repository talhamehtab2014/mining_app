import 'package:get/get.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/di/di.dart';
import 'package:mining_application/src/core/utils/routes.dart';
import 'package:mining_application/src/core/services/auth_service/auth_service.dart';
import 'package:mining_application/src/presentation/pre_login/models/actions/onboarding_action.dart';
import 'package:mining_application/src/presentation/pre_login/models/state/onboarding_state.dart';

class OnboardingViewModel extends GetxController {
  final String title = "Onboarding View Model";

  OnBoardingState _state = OnBoardingState.updateState(
    OnboardingStateEnum.login,
  );

  OnBoardingState get state => _state;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("OnboardingViewModel Created.");
  }

  Future<void> onAction(OnboardingAction action) async {
    action.when(
      loginRadioButton: () {
        _state = state.copyWith(state: OnboardingStateEnum.login);
        update();
      },
      signupRadioButton: () {
        _state = state.copyWith(state: OnboardingStateEnum.signup);
        update();
      },
      loginWithGoogle: () async {
        final auth = sl.get<AuthService>();
        try {
          final credential = await auth.signInWithGoogle();
          if (credential != null) {
            Get.offAndToNamed(Routes().getBottomNavigationPage());
          } else {
            // User cancelled; optionally show a message
          }
        } catch (e) {
          e.printError();
          Get.snackbar(
            "Google Sign-In failed",
            e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
          );
        }
      },
      loginWithPhone: () {
        Get.offAndToNamed(Routes().getBottomNavigationPage());
      },
      signupWithEmail: () {
        Get.offAndToNamed(Routes().getBottomNavigationPage());
      },
      loginWithEmail: () {
        Get.offAndToNamed(Routes().getBottomNavigationPage());
      },
    );
  }
}
