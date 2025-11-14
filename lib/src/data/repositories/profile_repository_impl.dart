import 'package:injectable/injectable.dart';
import 'package:mining_application/src/data/datasource/profile_datasource/profile_datasource.dart';
import 'package:mining_application/src/domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl({required ProfileDataSource profileDataSource})
    : _profileDataSource = profileDataSource;

  @override
  Future updateUserInformation(params) {
    return _profileDataSource.updateProfileDetails(params);
  }

  @override
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    return await _profileDataSource.getUserData(uid);
  }
}
