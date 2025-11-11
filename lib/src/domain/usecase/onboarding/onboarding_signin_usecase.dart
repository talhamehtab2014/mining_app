import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/domain/repositories/onboarding_repository.dart';

@lazySingleton
class OnboardingSignInUseCase extends UseCase<dynamic, dynamic> {
  final OnBoardingRepository _onboardingRepository;

  OnboardingSignInUseCase({required OnBoardingRepository onBoardingRepository})
      : _onboardingRepository = onBoardingRepository;

  @override
  Future call(dynamic params) {
    return _onboardingRepository.signIn(params);
  }
}