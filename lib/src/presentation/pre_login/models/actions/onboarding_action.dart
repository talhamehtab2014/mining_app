import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

part 'onboarding_action.freezed.dart';

@freezed
abstract class OnboardingAction with _$OnboardingAction {
  const factory OnboardingAction.loginRadioButton() = LoginRadioButton;

  const factory OnboardingAction.signupRadioButton() = SignupRadioButton;

  const factory OnboardingAction.loginWithGoogle() = LoginWithGoogle;

  const factory OnboardingAction.loginWithPhone() = LoginWithPhone;

  const factory OnboardingAction.signupWithEmail(
    SignupRequestModel requestModel,
  ) = SignupWithEmail;

  const factory OnboardingAction.loginWithEmail(String email, String password) = LoginWithEmail;
  const factory OnboardingAction.updateUseEffectState() = UpdateUseEffect;
}
