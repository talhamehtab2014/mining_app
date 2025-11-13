import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/presentation/pre_login/models/login_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

abstract class OnBoardingRepository {
  Future<dynamic> signIn(LoginRequestModel params);

  Future<dynamic> signUp(SignupRequestModel params);

  Future<dynamic> signUpWithGoogle(NoParams params);
}
