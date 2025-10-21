import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mining_application/src/core/enum/enums.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState({required OnboardingStateEnum state}) =
      _OnBoardingState;

  factory OnBoardingState.initial() =>
      OnBoardingState(state: OnboardingStateEnum.login);

  factory OnBoardingState.updateState(OnboardingStateEnum state) =>
      OnBoardingState(state: state);
}
