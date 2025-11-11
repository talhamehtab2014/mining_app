import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/parser/baseurl_parser.dart';
import 'package:mining_application/src/core/network/network_constants.dart';
import 'package:mining_application/src/core/network/pretty_dio_logger.dart';

import 'error_handler.dart';

part "network_call_impl.dart";

/// An abstract class defining the structure for making network calls.
///
/// This class provides a blueprint for handling HTTP requests such as GET, POST, PUT,
/// PATCH, DELETE, and POST with image data. It also includes a method for resolving API metadata.
abstract class NetworkCall {
  /// Sends a POST request to the specified API.
  ///
  /// - Parameters:
  ///   - [api]: [String] The endpoint URL to which the POST request is made.
  ///   - [data]: [dynamic] The body of the request, typically in JSON format.
  ///   - [queryParameters]: [Map<String, dynamic>?] Optional query parameters to append to the URL.
  ///   - [headers]: [Map<String, dynamic>?] Optional custom headers for the request.
  ///   - [jwt]: [String?] Optional JWT for authentication.
  ///
  /// Returns: [Future<Response<dynamic>>] A future response of the network POST request.
  Future<Response<dynamic>> onPost(
      {required String api,
        required dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        String? jwt});

  /// Sends a POST request with image data to the specified API.
  ///
  /// - Parameters:
  ///   - [api]: The endpoint URL to which the POST request is made.
  ///   - [data]: The image data as a base64-encoded string.
  ///   - [jwt]: Optional JWT for authentication.
  ///
  /// Returns: [Future<Response<dynamic>>] A future response of the network POST with Image request.
  Future<Response<dynamic>> onPostImageData(
      {required String api, required String data, String? jwt});

  /// Sends a PUT request to the specified API.
  ///
  /// - Parameters:
  ///   - [api]: [String] The endpoint URL to which the PUT request is made.
  ///   - [data]: [dynamic] The body of the request, typically in JSON format.
  ///   - [queryParameters]: [Map<String, dynamic>?] Optional query parameters to append to the URL.
  ///   - [headers]: [Map<String, dynamic>?] Optional custom headers for the request.
  ///   - [jwt]: [String?] Optional JWT for authentication.
  ///
  /// Returns: [Future<Response<dynamic>>] A future response of the network PUT request.
  Future<Response<dynamic>> onPut(
      {required String api,
        required dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        String? jwt});

  /// Sends a PATCH request to the specified API.
  ///
  /// - Parameters:
  ///   - [api]: [String] The endpoint URL to which the PATCH request is made.
  ///   - [data]: [dynamic] The body of the request, typically in JSON format.
  ///   - [queryParameters]: [Map<String, dynamic>?] Optional query parameters to append to the URL.
  ///   - [headers]: [Map<String, dynamic>?] Optional custom headers for the request.
  ///   - [jwt]: [String?] Optional JWT for authentication.
  ///
  /// Returns: [Future<Response<dynamic>>] A future response of the network PATCH request.
  Future<Response<dynamic>> onPatch(
      {required String api,
        required dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        String? jwt});

  /// Sends a GET request to the specified API.
  ///
  /// - Parameters:
  ///   - [api]: [String] The endpoint URL to which the GET request is made.
  ///   - [queryParameters]: [Map<String, dynamic>?] Optional query parameters to append to the URL.
  ///   - [headers]: [Map<String, dynamic>?] Optional custom headers for the request.
  ///   - [jwt]: [String?] Optional JWT for authentication.
  ///
  /// Returns: [Future<Response<dynamic>>] A future response of the network GET request.
  Future<Response<dynamic>> onGet(
      {required String api,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        String? jwt});

  /// Sends a DELETE request to the specified API.
  ///
  /// - Parameters:
  ///   - [api]: [String] The endpoint URL to which the DELETE request is made.
  ///   - [queryParameters]: [Map<String, dynamic>?] Optional query parameters to append to the URL.
  ///   - [headers]: [Map<String, dynamic>?] Optional custom headers for the request.
  ///   - [jwt]: [String?] Optional JWT for authentication.
  ///
  /// Returns: [Future<Response<dynamic>>] A future response of the network DELETE request.
  Future<Response<dynamic>> onDelete(
      {required String api,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        String? jwt});

  /// Resolves API metadata such as query parameters, headers, and authentication tokens.
  ///
  /// - Parameters:
  ///   - [queryParameters]: [Map<String, dynamic>?] Optional query parameters to include in the request.
  ///   - [headers]: [Map<String, dynamic>?] Optional headers to include in the request.
  ///   - [jwt]: [String?] Optional JWT for authentication.
  ///
  /// This method is used internally to preprocess or standardize metadata before making a request.
  void resolveAPIMetadata(
      {Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        String? jwt});
}
