import 'package:mining_application/src/core/enum/enums.dart';

abstract class LocalDataSource {
  Future<Map<String, dynamic>> fetchDataFromLocalStorage({
    List<LocalKeys>? keys,
  });
}
