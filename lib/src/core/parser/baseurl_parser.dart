import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/extensions/map_extension.dart';
import 'package:mining_application/src/core/network/network_constants.dart';

@lazySingleton
class BaseUrlParser {
  final NetworkConstants _constants;
  late final Map<String, String> _baseUrlBasedOnEndpoint;

  NetworkConstants get constants => _constants;

  BaseUrlParser(this._constants) {
    _baseUrlBasedOnEndpoint = <String, String>{};
  }

  String parse(String endpoint) =>
      _baseUrlBasedOnEndpoint.getWithDefault(endpoint, _constants.baseUrl);
}
