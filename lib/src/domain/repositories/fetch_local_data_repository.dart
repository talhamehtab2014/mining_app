import 'package:mining_application/src/core/enum/enums.dart';

abstract class FetchLocalDataRepository{
  Future<Map<String, dynamic>> fetchDataFromLocalStorage({List<LocalKeys>? keys});
}