import 'package:mining_application/src/core/enum/enums.dart';

class BaseEnv {
  AppEnv _currentAppEnv = AppEnv.staging;

  void setEnv(AppEnv appEnv) => _currentAppEnv = appEnv;

  AppEnv get currentAppEnv => _currentAppEnv;
}
