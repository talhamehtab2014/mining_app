import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/base_env/base_env.dart';
import 'package:mining_application/src/core/enum/enums.dart';

@lazySingleton
class NetworkConstants {
  final BaseEnv baseEnv;

  NetworkConstants(this.baseEnv);

  // -----------------------------------URLs-------------------------------------
  static const String BASE_URL = "";

  static const String _STAGE_BASE_URL = '$BASE_URL/';

  static const String _PROD_BASE_URL = BASE_URL;

  String get baseUrl => baseEnv.currentAppEnv == AppEnv.staging
      ? _STAGE_BASE_URL
      : _PROD_BASE_URL;

  //-------------------- Getters --------------------------------------------

  // -------------------- Methods --------------------------------------------

  // -------------------- Methods --------------------------------------------
}
