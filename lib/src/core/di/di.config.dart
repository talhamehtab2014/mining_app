// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/web.dart' as _i120;
import 'package:mining_application/src/core/base_env/base_env.dart' as _i157;
import 'package:mining_application/src/core/di/module_injector.dart' as _i890;
import 'package:mining_application/src/core/services/network/pretty_dio_logger.dart'
    as _i766;
import 'package:mining_application/src/core/services/network/network_constants.dart'
    as _i0;
import 'package:mining_application/src/core/utils/constants.dart' as _i138;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final modulesInjector = _$ModulesInjector();
    final dioInjector = _$DioInjector();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => modulesInjector.sharedPreference,
      preResolve: true,
    );
    gh.lazySingleton<_i120.Logger>(() => modulesInjector.logger);
    gh.lazySingleton<_i157.BaseEnv>(() => modulesInjector.baseEnv);
    gh.lazySingleton<_i766.PrettyDioLogger>(
      () => modulesInjector.prettyDioLogger,
    );
    gh.lazySingleton<_i895.Connectivity>(() => modulesInjector.connectivity);
    gh.lazySingleton<_i138.Constants>(() => _i138.Constants());
    gh.lazySingleton<_i0.NetworkConstants>(
      () => _i0.NetworkConstants(gh<_i157.BaseEnv>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioInjector.dio(gh<_i0.NetworkConstants>()),
    );
    return this;
  }
}

class _$ModulesInjector extends _i890.ModulesInjector {}

class _$DioInjector extends _i890.DioInjector {}
