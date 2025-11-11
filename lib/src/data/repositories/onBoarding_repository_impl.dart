import 'package:injectable/injectable.dart';
import 'package:mining_application/src/data/datasource/onboarding_datasource/onboarding_datasource.dart';
import 'package:mining_application/src/domain/repositories/onboarding_repository.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

@LazySingleton(as: OnBoardingRepository)
class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingDataSource _onBoardingDataSource;

  OnBoardingRepositoryImpl({required OnBoardingDataSource onboardingDataSource})
    : _onBoardingDataSource = onboardingDataSource;

  @override
  Future signIn() {
    return _onBoardingDataSource.signIn({});
  }

  @override
  Future signUp(SignupRequestModel params) {
    return _onBoardingDataSource.signUp(params);
  }
}
