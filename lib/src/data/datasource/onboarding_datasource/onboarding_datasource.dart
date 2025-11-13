import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/presentation/pre_login/models/login_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

abstract class OnBoardingDataSource {
  Future<Map<String, dynamic>?> signIn(LoginRequestModel params);

  Future<Map<String, dynamic>?> signUp(SignupRequestModel params);

  Future<Map<String, dynamic>?> signUpWithGoogle(NoParams params);
}
