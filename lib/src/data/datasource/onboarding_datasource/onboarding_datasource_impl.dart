import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/network/network_call.dart';
import 'package:mining_application/src/core/network/network_constants.dart';
import 'package:mining_application/src/core/services/auth_service/auth_service.dart';
import 'package:mining_application/src/core/utils/constants.dart';
import 'package:mining_application/src/data/datasource/onboarding_datasource/onboarding_datasource.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

@LazySingleton(as: OnBoardingDataSource)
class OnBoardingDataSourceImpl extends OnBoardingDataSource {
  final NetworkCall networkCall;
  final AuthService authService;
  final NetworkConstants networkConstant;
  final Constants constants;

  OnBoardingDataSourceImpl({
    required this.networkCall,
    required this.authService,
    required this.networkConstant,
    required this.constants,
  });

  @override
  Future signIn(params) {
    // TODO: implement SignIn
    throw UnimplementedError();
  }

  @override
  Future signUp(SignupRequestModel params) {
    return authService.signUp(
      name: params.strName,
      email: params.strEmail,
      password: params.strPassword,
      phone: params.strPhoneNumber ?? '',
      referralCode: params.strReferralCode ?? '',
    );
  }
}
