import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/domain/repositories/onboarding_repository.dart';
import 'package:mining_application/src/presentation/pre_login/models/login_request_model.dart';

@lazySingleton
class OnboardingSignInUseCase extends UseCase<LoginRequestModel, dynamic> {
  final OnBoardingRepository _onboardingRepository;

  OnboardingSignInUseCase({required OnBoardingRepository onBoardingRepository})
      : _onboardingRepository = onBoardingRepository;

  @override
  Future call(LoginRequestModel params) {
    return _onboardingRepository.signIn(params);
  }
}

