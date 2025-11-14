import 'package:mining_application/src/domain/usecase/profile/update_data_usecase.dart';

abstract class ProfileRepository {
  Future<Map<String, dynamic>?> updateUserInformation(UpdateDataUseCaseParams params);

  Future<Map<String, dynamic>?> getUserData(String uid);
}
