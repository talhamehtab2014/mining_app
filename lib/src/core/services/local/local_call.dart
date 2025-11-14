import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_call_impl.dart';

/// Abstract class to manage local storage operations.
///
/// This class provides methods to save, retrieve, and delete data
/// in local storage with support for various data types.
abstract class LocalCall {
  /// Saves a string value to local storage.
  ///
  /// It waits for the result to ensure the data is stored successfully.
  ///
  /// - Parameters:
  ///   - [key]: [String] A unique identifier for the value to be saved.
  ///   - [value]: [String] The string value to store in local storage.
  Future<void> saveString(String key, String value);

  /// Saves an integer value to local storage.
  ///
  /// It waits for the result to ensure the data is stored successfully.
  ///
  /// - Parameters:
  ///   - [key]: [String] A unique identifier for the value to be saved.
  ///   - [value]: [int] The integer value to store in local storage.
  Future<void> saveInt(String key, int value);

  /// Saves a boolean value to local storage.
  ///
  /// It waits for the result to ensure the data is stored successfully.
  ///
  /// - Parameters:
  ///   - [key]: [String] A unique identifier for the value to be saved.
  ///   - [value]: [bool] The boolean value to store in local storage.
  Future<void> saveBoolean(String key, bool value);

  /// Saves a double value to local storage.
  ///
  /// It waits for the result to ensure the data is stored successfully.
  ///
  /// - Parameters:
  ///   - [key]: [String] A unique identifier for the value to be saved.
  ///   - [value]: [double] The double value to store in local storage.
  Future<void> saveDouble(String key, double value);

  /// Saves a list of strings to local storage.
  ///
  /// It waits for the result to ensure the data is stored successfully.
  ///
  /// - Parameters:
  ///   - [key]: [String] A unique identifier for the value to be saved.
  ///   - [value]: The list of strings to store in local storage.
  Future<void> saveStringList(String key, List<String> value);

  /// Retrieves a string value from local storage.
  ///
  /// - Parameters:
  ///   - [key]: [String] The unique identifier for the value to retrieve.
  /// - Returns: The [String] value associated with the key, or `null` if not found.
  String? getString(String key);

  /// Retrieves an integer value from local storage.
  ///
  /// - Parameters:
  ///   - [key]: [String] The unique identifier for the value to retrieve.
  /// - Returns: The [integer] value associated with the key, or `null` if not found.
  int? getInt(String key);

  /// Retrieves a boolean value from local storage.
  ///
  /// - Parameters:
  ///   - [key]: [String] The unique identifier for the value to retrieve.
  /// - Returns: The [boolean] value associated with the key, or `null` if not found.
  bool? getBoolean(String key);

  /// Retrieves a double value from local storage.
  ///
  /// - Parameters:
  ///   - [key]: [String] The unique identifier for the value to retrieve.
  /// - Returns: The [double] value associated with the key, or `null` if not found.
  double? getDouble(String key);

  /// Retrieves a list of strings from local storage.
  ///
  /// - Parameters:
  ///   - [key]: [String] The unique identifier for the value to retrieve.
  /// - Returns: The list of [strings] associated with the key, or `null` if not found.
  List<String>? getStringList(String key);

  /// Removes a value associated with the specified key from local storage.
  ///
  /// - Parameters:
  ///   - [key]: [String] The unique identifier for the value to remove.
  /// - Returns: A [Future] that completes when the operation is finished.
  Future<void> remove(String key);

  /// Clears all values from local storage.
  ///
  /// This will remove all stored data, resetting the storage to an empty state.
  ///
  /// - Returns: A [Future] that completes when the operation is finished.
  Future<void> clear();

  Future<void> saveUserToLocal(Map<String, dynamic>? userData);
}
