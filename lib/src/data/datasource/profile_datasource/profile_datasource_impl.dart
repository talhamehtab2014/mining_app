import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/services/auth_service/auth_service.dart';
import 'package:mining_application/src/data/datasource/profile_datasource/profile_datasource.dart';

@LazySingleton(as: ProfileDataSource)
class ProfileDataSourceImpl extends ProfileDataSource {
  final AuthService _authService;

  ProfileDataSourceImpl({required AuthService authService})
    : _authService = authService;

  @override
  Future updateProfileDetails(params) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    return await _authService.getUserById(uid);
  }
}
