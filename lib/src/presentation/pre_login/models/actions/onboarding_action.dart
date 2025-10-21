import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_action.freezed.dart';

@freezed
abstract class OnboardingAction with _$OnboardingAction {
  const factory OnboardingAction.loginRadioButton() = LoginRadioButton;

  const factory OnboardingAction.signupRadioButton() = SignupRadioButton;

  const factory OnboardingAction.loginWithGoogle() = LoginWithGoogle;

  const factory OnboardingAction.loginWithPhone() = LoginWithPhone;

  const factory OnboardingAction.signupWithEmail() = SignupWithEmail;

  const factory OnboardingAction.loginWithEmail() = LoginWithEmail;
}
