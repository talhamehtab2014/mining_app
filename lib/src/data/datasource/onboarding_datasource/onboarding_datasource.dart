import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';

abstract class OnBoardingDataSource {
  Future<dynamic> signIn(dynamic params);

  Future<dynamic> signUp(SignupRequestModel params);
}
