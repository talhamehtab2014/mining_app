import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/network/network_call.dart';
import 'package:mining_application/src/core/network/network_constants.dart';
import 'package:mining_application/src/core/utils/constants.dart';
import 'package:mining_application/src/data/datasource/onboarding_datasource/onboarding_datasource.dart';

@LazySingleton(as: OnBoardingDataSource)
class OnBoardingDataSourceImpl extends OnBoardingDataSource {
  final NetworkCall networkCall;
  final NetworkConstants networkConstant;
  final Constants constants;

  OnBoardingDataSourceImpl({
    required this.networkCall,
    required this.networkConstant,
    required this.constants,
  });

  @override
  Future SignIn(params) {
    // TODO: implement SignIn
    throw UnimplementedError();
  }

  @override
  Future SignUp(params) {
    // TODO: implement SignUp
    throw UnimplementedError();
  }
}
