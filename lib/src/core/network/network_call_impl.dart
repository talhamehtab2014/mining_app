part of 'network_call.dart';


@LazySingleton(as: NetworkCall)
class NetworkCallImp implements NetworkCall {
  final Dio _dio;
  final ErrorHandler _errorHandler;
  final PrettyDioLogger _prettyDioLogger;
  final BaseUrlParser _baseUrlParser;
  final NetworkConstants _constants;

  NetworkCallImp({
    required Dio dio,
    required ErrorHandler errorHandler,
    required PrettyDioLogger prettyDioLogger,
    required BaseUrlParser baseUrlParser,
    required NetworkConstants constants,
  })  : _dio = dio,
        _errorHandler = errorHandler,
        _prettyDioLogger = prettyDioLogger,
        _constants = constants,
        _baseUrlParser = baseUrlParser {
    _initializeInterceptor();
  }

  void _initializeInterceptor() {
    _dio.interceptors.addAll([
      _prettyDioLogger,
    ]);
  }

  Future<Response<dynamic>> _makeRequest(
      Future<Response<dynamic>> Function() request,
      String api,
      String method,
      ) async {
    try {
      /// Change the request [BASE URL] : [Parser] based on the endpoint
      _dio.options.baseUrl = _baseUrlParser.parse(api);

      /// Call the request function
      return await request();

      /// Handle Exceptions
    } on DioException catch (e) {
      // _logger.wtf('[$method | DIO ERROR] [API | $api] ${e.response}');
      if (e.type == DioErrorType.badResponse) {
        throw _errorHandler.resolveErrors(response: e.response!);
      }
      throw _errorHandler.throwDefaultFailure();
    } catch (e) {
      // _logger.wtf('[$method | ERROR] [API | $api] $e');
      throw _errorHandler.throwDefaultFailure();
    }
  }

  @override
  Future<Response<dynamic>> onPost({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    resolveAPIMetadata(
        queryParameters: queryParameters, headers: headers, jwt: jwt);
    return _makeRequest(
          () => _dio.post(api, data: data),
      api,
      'POST',
    );
  }

  @override
  Future<Response<dynamic>> onPut({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    resolveAPIMetadata(
        queryParameters: queryParameters, headers: headers, jwt: jwt);
    return _makeRequest(
          () => _dio.put(api, data: data),
      api,
      'PUT',
    );
  }

  @override
  Future<Response<dynamic>> onPostImageData({
    required String api,
    required String data,
    String? jwt,
  }) async {
    resolveAPIMetadata(jwt: jwt);
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        data,
        filename: data.split('/').last,
      ),
    });
    return _makeRequest(
          () => _dio.post(api, data: formData),
      api,
      'POST_IMAGE',
    );
  }

  @override
  Future<Response<dynamic>> onPatch({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    resolveAPIMetadata(
        queryParameters: queryParameters, headers: headers, jwt: jwt);
    return _makeRequest(
          () => _dio.patch(api, data: data),
      api,
      'PATCH',
    );
  }

  @override
  Future<Response<dynamic>> onGet({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    resolveAPIMetadata(
        queryParameters: queryParameters, headers: headers, jwt: jwt);
    return _makeRequest(
          () => _dio.get(api),
      api,
      'GET',
    );
  }

  @override
  Future<Response<dynamic>> onDelete({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    resolveAPIMetadata(
        queryParameters: queryParameters, headers: headers, jwt: jwt);
    return _makeRequest(
          () => _dio.delete(api),
      api,
      'DELETE',
    );
  }

  @override
  void resolveAPIMetadata({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) {
    _dio.options.queryParameters.clear();
    if (queryParameters != null) {
      _dio.options.queryParameters.addAll(queryParameters);
    }
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
  }
}
