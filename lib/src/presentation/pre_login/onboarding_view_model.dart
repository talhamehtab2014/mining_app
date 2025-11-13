import 'package:get/get.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/core/utils/routes.dart';
import 'package:mining_application/src/domain/usecase/onboarding/onboarding_signin_usecase.dart';
import 'package:mining_application/src/domain/usecase/onboarding/onboarding_signup_with_google_usecase.dart';
import 'package:mining_application/src/presentation/pre_login/models/actions/onboarding_action.dart';
import 'package:mining_application/src/presentation/pre_login/models/login_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/state/onboarding_state.dart';

import '../../domain/usecase/onboarding/onboarding_signup_usecase.dart';

class OnboardingViewModel extends GetxController {
  final String title = "Onboarding View Model";
  final OnboardingSignInUseCase _onboardingSignInUseCase;
  final OnboardingSignUpUseCase _onboardingSignUpUseCase;
  final OnboardingSignUpWithGoogleUseCase _onboardingSignUpWithGoogleUseCase;

  OnBoardingState _state = OnBoardingState.updateState(
    OnboardingStateEnum.login,
    false,
  );

  OnBoardingState get state => _state;

  set state(OnBoardingState value) {
    _state = value;
  }

  OnboardingViewModel({
    required OnboardingSignInUseCase onboardingSignInUseCase,
    required OnboardingSignUpUseCase onboardingSignUpUseCase,
    required OnboardingSignUpWithGoogleUseCase
    onboardingSignUpWithGoogleUseCase,
  }) : _onboardingSignInUseCase = onboardingSignInUseCase,
       _onboardingSignUpUseCase = onboardingSignUpUseCase,
       _onboardingSignUpWithGoogleUseCase = onboardingSignUpWithGoogleUseCase;

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
      loginWithGoogle: _signupWithGoogleSSN,
      loginWithPhone: () {
        Get.offAndToNamed(Routes().getBottomNavigationPage());
      },
      signupWithEmail: _signUpWithEmailAndPassword,
      loginWithEmail: _loginWithEmailAndPassword,
    );
  }

  void _signupWithGoogleSSN() async {
    _state = state.copyWith(isLoading: true);
    update();
    try {
      final credential = await _onboardingSignUpWithGoogleUseCase(NoParams());
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
    } finally {
      _state = state.copyWith(isLoading: false);
      update();
    }
  }

  void _loginWithEmailAndPassword(String email, String password) async {
    _state = state.copyWith(isLoading: true);
    update();
    try {
      final res = await _onboardingSignInUseCase(
        LoginRequestModel(strEmail: email, strPassword: password),
      );
      print(res);
    } catch (e) {
      e.printError();
      Get.snackbar(
        "Sign-In failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      _state = state.copyWith(isLoading: false);
      update();
    }
  }

  void _signUpWithEmailAndPassword(SignupRequestModel reqModel) async {
    _state = state.copyWith(isLoading: true);
    update();
    try {
      final res = await _onboardingSignUpUseCase(reqModel);
      print(res);
    } catch (e) {
      e.printError();
      Get.snackbar(
        "Sign-up failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      _state = state.copyWith(isLoading: false);
      update();
    }
  }
}
