abstract class ProfileDataSource {
  Future<dynamic> updateProfileDetails(dynamic params);
  Future<Map<String, dynamic>?> getUserData(String uid);
}