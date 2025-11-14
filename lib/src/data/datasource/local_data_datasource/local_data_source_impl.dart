import 'package:injectable/injectable.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/services/local/local_call.dart';
import 'package:mining_application/src/data/datasource/local_data_datasource/local_data_source.dart';

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  final LocalCall _localCall;
  final List<LocalKeys> localStorageKeys = [
    LocalKeys.uid,
    LocalKeys.name,
    LocalKeys.email,
    LocalKeys.phone,
    LocalKeys.referralCode,
    LocalKeys.totalBalance,
    LocalKeys.totalSessions,
    LocalKeys.totalReferrals,
    LocalKeys.earnedFromReferrals,
    LocalKeys.userReferralCode,
    LocalKeys.createdAt,
  ];

  LocalDataSourceImpl({required LocalCall localCall}) : _localCall = localCall;

  @override
  Future<Map<String, dynamic>> fetchDataFromLocalStorage({
    List<LocalKeys>? keys,
  }) async {
    // If no keys are passed, use all default keys
    final selectedKeys = keys ?? localStorageKeys;

    final Map<String, dynamic> data = {};

    for (final element in selectedKeys) {
      // If getString is async, add `await` here and make sure it returns a Future
      data[element.name] = _localCall.getString(element.name);
    }

    return data;
  }
}
