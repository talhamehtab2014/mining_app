part of 'local_call.dart';

@LazySingleton(as: LocalCall)
class LocalCallImp implements LocalCall {
  final SharedPreferences _preferences;

  LocalCallImp(this._preferences);

  @override
  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  @override
  Future<void> saveBoolean(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  @override
  Future<void> saveStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  @override
  bool? getBoolean(String key) {
    return _preferences.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  @override
  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _preferences.clear();
  }
}
