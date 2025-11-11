import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:mining_application/src/core/base_env/base_env.dart';
import 'package:mining_application/src/core/network/pretty_dio_logger.dart';
import 'package:mining_application/src/core/network/network_constants.dart';
import 'package:mining_application/src/core/utils/constants.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioInjector {
  @lazySingleton
  Dio dio(NetworkConstants networkConstants) => Dio(
    BaseOptions(
      baseUrl: networkConstants.baseUrl,
      receiveTimeout: const Duration(milliseconds: 60000),
      connectTimeout: const Duration(milliseconds: 60000),
      sendTimeout: const Duration(milliseconds: 60000),
    ),
  );
}

@module
abstract class ModulesInjector {
  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  BaseEnv get baseEnv {
    final baseEnv = BaseEnv();
    final env = Constants.currentEnv == AppEnv.staging
        ? AppEnv.staging
        : AppEnv.production;
    baseEnv.setEnv(env);
    return baseEnv;
  }

  @preResolve
  Future<SharedPreferences> get sharedPreference =>
      SharedPreferences.getInstance();

  @lazySingleton
  PrettyDioLogger get prettyDioLogger {
    return kDebugMode
        ? PrettyDioLogger(
            requestBody: true,
            error: true,
            request: true,
            compact: true,
            maxWidth: 90,
            requestHeader: true,
            responseBody: true,
            responseHeader: false,
          )
        : PrettyDioLogger(
            requestBody: false,
            error: false,
            request: false,
            compact: false,
            maxWidth: 0,
            requestHeader: false,
            responseBody: false,
            responseHeader: false,
          );
  }

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
