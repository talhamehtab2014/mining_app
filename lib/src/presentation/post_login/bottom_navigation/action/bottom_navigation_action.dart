import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_action.freezed.dart';

@freezed
abstract class BottomNavigationAction with _$BottomNavigationAction {
  const factory BottomNavigationAction.homeAction() = HomeAction;

  const factory BottomNavigationAction.referralAction() = ReferralAction;

  const factory BottomNavigationAction.historyAction() = HistoryAction;

  const factory BottomNavigationAction.settingsAction() = SettingsAction;
}
