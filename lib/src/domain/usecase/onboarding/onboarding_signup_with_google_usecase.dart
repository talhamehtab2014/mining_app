import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/domain/repositories/onboarding_repository.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

@lazySingleton
class OnboardingSignUpWithGoogleUseCase extends UseCase<NoParams, dynamic> {
  final OnBoardingRepository _onboardingRepository;

  OnboardingSignUpWithGoogleUseCase({required OnBoardingRepository onBoardingRepository})
    : _onboardingRepository = onBoardingRepository;

  @override
  Future call(dynamic params) {
    return _onboardingRepository.signUpWithGoogle(params);
  }
}
