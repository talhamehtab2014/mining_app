import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mining_application/src/core/enum/enums.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnBoardingState with _$OnBoardingState {
  factory OnBoardingState.updateState(OnboardingStateEnum state, bool isLoading) =
      _OnBoardingUpdateState;
}
