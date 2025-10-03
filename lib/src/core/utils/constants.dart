import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/enum/enums.dart';

@lazySingleton
class Constants {
  static AppEnv currentEnv = AppEnv.production;
}
