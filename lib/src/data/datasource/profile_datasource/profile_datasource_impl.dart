import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/services/auth_service/firebase_service.dart';
import 'package:mining_application/src/data/datasource/profile_datasource/profile_datasource.dart';

@LazySingleton(as: ProfileDataSource)
class ProfileDataSourceImpl extends ProfileDataSource {
  final FirebaseService _authService;

  ProfileDataSourceImpl({required FirebaseService authService})
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
