import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/domain/usecase/post_login_usecase/fetch_local_data.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/action/bottom_navigation_action.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/model/bottom_navgation_item_model.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/model/bottom_navigation_state.dart';
import 'package:mining_application/src/presentation/side_effects/side_effects.dart';

class BottomNavigationViewModel extends GetxController {
  int selectedIndex = 0;
  List<BottomNavigationItemModel> iconData = [
    BottomNavigationItemModel(
      iconPath: Icons.home_outlined,
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
  final FetchLocalDataUseCase _fetchLocalDataUseCase;
  BottomNavigationState _state = BottomNavigationState.homeState();

  BottomNavigationState get state => _state;

  UiEffect? effect;

  BottomNavigationViewModel({
    required FetchLocalDataUseCase fetchLocalDataUseCase,
  }) : _fetchLocalDataUseCase = fetchLocalDataUseCase;

  void emitEffect(UiEffect newEffect) {
    effect = newEffect;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('BottomNavigationViewModel initialized');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateNameAndAmount();
    });
  }

  _updateNameAndAmount() async {
    try {
      final res = await _fetchLocalDataUseCase([
        LocalKeys.name,
        LocalKeys.totalBalance,
      ]);
      emitEffect(
        ShowUserNameTitle(
          res[LocalKeys.name.name],
          "${res[LocalKeys.totalBalance.name]} AU",
        ),
      );
    } catch (e) {
      e.printError();
    }
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

  void loadDataFromLocalStorage() {}
}
