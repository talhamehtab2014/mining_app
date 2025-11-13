import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/services/auth_service/auth_service.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/data/datasource/onboarding_datasource/onboarding_datasource.dart';
import 'package:mining_application/src/presentation/pre_login/models/login_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

@LazySingleton(as: OnBoardingDataSource)
class OnBoardingDataSourceImpl extends OnBoardingDataSource {
  final AuthService authService;

  OnBoardingDataSourceImpl({required this.authService});

  @override
  Future<Map<String, dynamic>?> signIn(LoginRequestModel params) async{
    return await authService.login(
      email: params.strEmail,
      password: params.strPassword,
    );
  }

  @override
  Future<Map<String, dynamic>?> signUp(SignupRequestModel params)async {
    return await authService.signUp(
      name: params.strName,
      email: params.strEmail,
      password: params.strPassword,
      phone: params.strPhoneNumber ?? '',
      referralCode: params.strReferralCode ?? '',
    );
  }

  @override
  Future<Map<String, dynamic>?> signUpWithGoogle(NoParams params)async {
    return await authService.signInWithGoogle();
  }
}
