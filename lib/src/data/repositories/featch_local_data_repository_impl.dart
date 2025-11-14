import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/data/datasource/local_data_datasource/local_data_source.dart';
import 'package:mining_application/src/domain/repositories/fetch_local_data_repository.dart';

@LazySingleton(as: FetchLocalDataRepository)
class FetchLocalDataRepositoryImpl extends FetchLocalDataRepository {
  final LocalDataSource _localDataSource;

  FetchLocalDataRepositoryImpl({required LocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<Map<String, dynamic>> fetchDataFromLocalStorage({
    List<LocalKeys>? keys,
  }) {
    return _localDataSource.fetchDataFromLocalStorage(keys: keys);
  }
}
