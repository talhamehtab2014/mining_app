import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_state.freezed.dart';

@freezed
abstract class BottomNavigationState with _$BottomNavigationState {
  factory BottomNavigationState.homeState() = _BottomNavigationHomeState;
  factory BottomNavigationState.referralState() = _BottomNavigationReferralState;
  factory BottomNavigationState.historyState() = _BottomNavigationHistoryState;
  factory BottomNavigationState.settingsState() = _BottomNavigationSettingsState;
}
