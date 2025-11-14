
abstract class ProfileRepository{
    Future<dynamic> updateUserInformation(dynamic params);
    Future<Map<String, dynamic>?> getUserData(String uid);
}