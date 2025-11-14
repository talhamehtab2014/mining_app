import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/services/theme_service/theme_service.dart';
import 'package:mining_application/src/domain/usecase/post_login_usecase/fetch_local_data.dart';
import 'package:mining_application/src/domain/usecase/profile/get_user_data.dart';
import 'package:mining_application/src/domain/usecase/profile/update_data_usecase.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/action/profile_view_action.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/profile_model.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/state/profile_view_state.dart';
import 'package:mining_application/src/presentation/side_effects/side_effects.dart';

class ProfileViewModel extends GetxController {
  final UpdateDataUseCase _updateDataUseCase;
  final GetUserDataUseCase _getUserDataUseCase;
  final FetchLocalDataUseCase _fetchLocalDataUseCase;
  final ThemeService _themeService;

  UiEffect? effect;

  void emitEffect(UiEffect newEffect) {
    effect = newEffect;
    update();
  }

  ProfileViewState _state = ProfileViewState.initial(
    ProfileModel(
      isProfileEdited: false,
      username: '',
      email: '',
      phoneNumber: '',
      isDarkMode: false,
    ),
  );

  ProfileViewModel({
    required UpdateDataUseCase updateDataUseCase,
    required GetUserDataUseCase getUserDataUseCase,
    required FetchLocalDataUseCase fetchLocalDataUseCase,
    required ThemeService themeService,
  }) : _updateDataUseCase = updateDataUseCase,
       _getUserDataUseCase = getUserDataUseCase,
       _fetchLocalDataUseCase = fetchLocalDataUseCase,
       _themeService = themeService;

  ProfileViewState get state => _state;

  set state(ProfileViewState value) {
    _state = value;
  }

  initializeFields() async {
    final localData = await _fetchLocalDataUseCase([
      LocalKeys.name,
      LocalKeys.email,
      LocalKeys.phone,
    ]);
    _state = ProfileViewState.initial(
      ProfileModel(
        isLoading: false,
        isProfileEdited: false,
        username: localData[LocalKeys.name.name],
        email: localData[LocalKeys.email.name],
        phoneNumber: localData[LocalKeys.phone.name],
        isDarkMode: _themeService.getTheme() == ThemeMode.dark,
      ),
    );
    emitEffect(
      UpdateFieldValues(
        value1: _state.profileModel?.username,
        value2: _state.profileModel?.email,
        value3: _state.profileModel?.phoneNumber,
      ),
    );
  }

  _getUserData() {}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeFields();
  }

  void onAction(ProfileViewAction action) {
    action.when(
      editProfile: (isEditable) {
        state.maybeMap(
          initial: (data) =>
              _updateModel((m) => m.copyWith(isProfileEdited: isEditable)),
          orElse: () => state,
        );
      },

      toggleTheme: () async {
        await _themeService.setTheme(
          _themeService.getTheme() == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light,
        );

        state.maybeMap(
          initial: (data) => _updateModel(
            (m) => m.copyWith(
              isDarkMode: _themeService.getTheme() == ThemeMode.dark,
            ),
          ),
          orElse: () => state,
        );
      },
      logout: () {},
      saveChanges: _updateUserData,
    );
    update();
  }

  _updateUserData(String? name, String? email, String? phoneNo) async {
    state.maybeMap(
      initial: (data) => _updateModel((m) => m.copyWith(isLoading: true)),
      orElse: () => state,
    );
    update();
    try {
      var data = await _fetchLocalDataUseCase([LocalKeys.uid]);
      var res = await _updateDataUseCase(
        UpdateDataUseCaseParams(data[LocalKeys.uid.name], name: name),
      );
      emitEffect(
        UpdateFieldValues(
          value1: res?[LocalKeys.name.name],
          value2: res?[LocalKeys.email.name],
          value3: res?[LocalKeys.phone.name],
        ),
      );
    } catch (e) {
      e.printError();
    } finally {
      state.maybeMap(
        initial: (data) => _updateModel(
          (m) => m.copyWith(isLoading: false, isProfileEdited: false),
        ),
        orElse: () => state,
      );
      update();
    }
  }

  void _updateModel(ProfileModel Function(ProfileModel) transform) {
    state = state.maybeMap(
      initial: (s) {
        final current = s.profileModel ?? ProfileModel();
        final updated = transform(current);
        if (updated == current) return s;
        return s.copyWith(profileModel: updated);
      },
      orElse: () {
        final base = transform(ProfileModel());
        return ProfileViewState.initial(
          base,
          // ...provide any other required fields for dataLoaded here
        );
      },
    );
  }
}
