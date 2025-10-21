import 'package:get/get.dart';
import 'package:mining_application/src/core/enum/enums.dart';
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

  onAction(OnboardingAction action) {
    action.when(
      loginRadioButton: () {
        _state = state.copyWith(state: OnboardingStateEnum.login);
        update();
      },
      signupRadioButton: () {
        _state = state.copyWith(state: OnboardingStateEnum.signup);
        update();
      },
      loginWithGoogle: () {},
      loginWithPhone: () {},
      signupWithEmail: () {},
      loginWithEmail: () {},
    );
  }
}
