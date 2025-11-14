import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/domain/repositories/profile_repository.dart';

@lazySingleton
class GetUserDataUseCase extends UseCase<String, Map<String, dynamic>?> {
  final ProfileRepository _profileRepository;

  GetUserDataUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  Future<Map<String, dynamic>?> call(String params) async {
    return await _profileRepository.getUserData(params);
  }
}
