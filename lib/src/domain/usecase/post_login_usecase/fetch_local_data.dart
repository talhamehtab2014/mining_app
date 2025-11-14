import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/domain/repositories/fetch_local_data_repository.dart';

@lazySingleton
class FetchLocalDataUseCase
    extends UseCase<List<LocalKeys>?, Map<String, dynamic>> {
  final FetchLocalDataRepository _fetchLocalDataRepository;

  FetchLocalDataUseCase({
    required FetchLocalDataRepository fetchLocalDataRepository,
  }) : _fetchLocalDataRepository = fetchLocalDataRepository;

  @override
  Future<Map<String, dynamic>> call(List<LocalKeys>? params) {
    return _fetchLocalDataRepository.fetchDataFromLocalStorage(keys: params);
  }
}
