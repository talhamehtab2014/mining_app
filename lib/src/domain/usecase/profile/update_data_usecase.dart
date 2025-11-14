import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/domain/repositories/profile_repository.dart';

@lazySingleton
class UpdateDataUseCase extends UseCase<dynamic, dynamic> {
  final ProfileRepository _profileRepository;

  UpdateDataUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  Future call(params) {
    return _profileRepository.updateUserInformation(params);
  }
}
