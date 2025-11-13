import 'package:mining_application/src/presentation/pre_login/models/login_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

abstract class OnBoardingDataSource {
  Future<dynamic> signIn(LoginRequestModel params);

  Future<dynamic> signUp(SignupRequestModel params);
}
