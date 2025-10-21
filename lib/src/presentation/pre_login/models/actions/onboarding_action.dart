import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_action.freezed.dart';

@freezed
class OnboardingAction with _$OnboardingAction {
  const factory OnboardingAction.login() = Login;

  const factory OnboardingAction.signup() = Signup;

  const factory OnboardingAction.loginWithGoogle() = LoginWithGoogle;

  const factory OnboardingAction.loginWithPhone() = LoginWithPhone;
}
