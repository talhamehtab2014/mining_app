import 'package:mining_application/src/domain/usecase/profile/update_data_usecase.dart';

abstract class ProfileDataSource {
  Future<Map<String, dynamic>?> updateProfileDetails(UpdateDataUseCaseParams params);
  Future<Map<String, dynamic>?> getUserData(String uid);
}