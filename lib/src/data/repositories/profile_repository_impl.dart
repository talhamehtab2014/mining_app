import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/services/local/local_call.dart';
import 'package:mining_application/src/data/datasource/profile_datasource/profile_datasource.dart';
import 'package:mining_application/src/domain/repositories/profile_repository.dart';
import 'package:mining_application/src/domain/usecase/profile/update_data_usecase.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource _profileDataSource;
  final LocalCall _localCall;

  ProfileRepositoryImpl({
    required ProfileDataSource profileDataSource,
    required LocalCall localCall,
  }) : _profileDataSource = profileDataSource,
       _localCall = localCall;

  @override
  Future<Map<String, dynamic>?> updateUserInformation(
    UpdateDataUseCaseParams params,
  ) async {
    final userData = await _profileDataSource.updateProfileDetails(params);
    _localCall.saveUserToLocal(userData);
    return userData;
  }

  @override
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    return await _profileDataSource.getUserData(uid);
  }
}
