import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/services/local/local_call.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/data/datasource/onboarding_datasource/onboarding_datasource.dart';
import 'package:mining_application/src/domain/repositories/onboarding_repository.dart';
import 'package:mining_application/src/presentation/pre_login/models/login_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

@LazySingleton(as: OnBoardingRepository)
class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingDataSource _onBoardingDataSource;
  final LocalCall _localCall;

  OnBoardingRepositoryImpl({
    required OnBoardingDataSource onboardingDataSource,
    required LocalCall localCall,
  }) : _onBoardingDataSource = onboardingDataSource,
       _localCall = localCall;

  @override
  Future signIn(LoginRequestModel params) async {
    final result = await _onBoardingDataSource.signIn(params);
    await _saveUserToLocal(result);
    return result;
  }

  @override
  Future signUp(SignupRequestModel params) async {
    final result = await _onBoardingDataSource.signUp(params);
    await _saveUserToLocal(result);
    return result;
  }

  @override
  Future<Map<String, dynamic>?> signUpWithGoogle(NoParams params) async {
    final result = await _onBoardingDataSource.signUpWithGoogle(params);
    await _saveUserToLocal(result);
    return result;
  }

  Future<void> _saveUserToLocal(Map<String, dynamic>? userData) async {
    if (userData == null) {
      return;
    }

    await _localCall.saveString(LocalKeys.uid.name, userData['uid'] ?? '');
    await _localCall.saveString(LocalKeys.name.name, userData['name'] ?? '');
    await _localCall.saveString(LocalKeys.email.name, userData['email'] ?? '');
    await _localCall.saveString(LocalKeys.phone.name, userData['phone'] ?? '');
    await _localCall.saveString(
      LocalKeys.referralCode.name,
      userData['referralCode'] ?? '',
    );
    await _localCall.saveInt(
      LocalKeys.totalBalance.name,
      userData['totalBalance'] ?? 0,
    );
    await _localCall.saveInt(
      LocalKeys.totalSessions.name,
      userData['totalSessions'] ?? 0,
    );
    await _localCall.saveInt(
      LocalKeys.totalReferrals.name,
      userData['totalReferrals'] ?? 0,
    );
    await _localCall.saveInt(
      LocalKeys.earnedFromReferrals.name,
      userData['earnedFromReferrals'] ?? 0,
    );
    await _localCall.saveString(
      LocalKeys.userReferralCode.name,
      userData['userReferralCode'] ?? '',
    );
    await _localCall.saveString(
      LocalKeys.createdAt.name,
      userData['createdAt'] ?? '',
    );
  }
}
