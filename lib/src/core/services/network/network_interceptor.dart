import 'package:dio/dio.dart';
import 'package:mining_application/src/core/services/network/network_constants.dart';

class GenericInterceptor extends Interceptor {
  final Dio _dio;
  final NetworkConstants constants;
  final int _retryCount = 0;

  Dio get dio => _dio;

  GenericInterceptor(this._dio, this.constants);
}
