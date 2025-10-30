import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/action/bottom_navigation_action.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/model/bottom_navgation_item_model.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/model/bottom_navigation_state.dart';

class BottomNavigationViewModel extends GetxController {
  int selectedIndex = 0;
  List<BottomNavigationItemModel> iconData = [
    BottomNavigationItemModel(
      iconPath: Icons.home,
      action: BottomNavigationAction.homeAction(),
      state: BottomNavigationState.homeState(),
    ),
    BottomNavigationItemModel(
      iconPath: Icons.history,
      action: BottomNavigationAction.historyAction(),
      state: BottomNavigationState.historyState(),
    ),
    BottomNavigationItemModel(
      iconPath: Icons.people_alt_outlined,
      action: BottomNavigationAction.referralAction(),
      state: BottomNavigationState.referralState(),
    ),
    BottomNavigationItemModel(
      iconPath: Icons.settings,
      action: BottomNavigationAction.settingsAction(),
      state: BottomNavigationState.settingsState(),
    ),
  ];
  BottomNavigationState _state = BottomNavigationState.homeState();

  BottomNavigationState get state => _state;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('BottomNavigationViewModel initialized');
  }

  void updateIndex(int index) {
    selectedIndex = index;
    update();
  }

  void onAction(BottomNavigationAction action) {
    action.when(
      homeAction: () {
        _state = _state.maybeWhen(
          homeState: () => _state,
          orElse: () => BottomNavigationState.homeState(),
        );
      },
      referralAction: () {
        _state = _state.maybeWhen(
          referralState: () => _state,
          orElse: () => BottomNavigationState.referralState(),
        );
      },
      historyAction: () {
        _state = _state.maybeWhen(
          historyState: () => _state,
          orElse: () => BottomNavigationState.historyState(),
        );
      },
      settingsAction: () {
        _state = _state.maybeWhen(
          settingsState: () => _state,
          orElse: () => BottomNavigationState.settingsState(),
        );
      },
    );
    update();
  }
}
