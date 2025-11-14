import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/usecase/usecase.dart';
import 'package:mining_application/src/domain/repositories/profile_repository.dart';

@lazySingleton
class UpdateDataUseCase extends UseCase<UpdateDataUseCaseParams, Map<String, dynamic>?> {
  final ProfileRepository _profileRepository;

  UpdateDataUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  Future<Map<String, dynamic>?> call(UpdateDataUseCaseParams params) async {
    return await _profileRepository.updateUserInformation(params);
  }
}

class UpdateDataUseCaseParams extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? phoneNo;

  const UpdateDataUseCaseParams(this.id, {this.name, this.email, this.phoneNo});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, phoneNo];
}
