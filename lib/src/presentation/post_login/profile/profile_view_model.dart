import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/di/di.dart';
import 'package:mining_application/src/core/services/theme_service/theme_service.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/action/profile_view_action.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/profile_model.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/state/profile_view_state.dart';

class ProfileViewModel extends GetxController {
  ProfileViewState _state = ProfileViewState.initial(
    ProfileModel(
      isProfileEdited: false,
      username: 'John Doe',
      email: 'dummy@gmail.com',
      phoneNumber: '+1234567890',
      isDarkMode: false,
    ),
  );

  ProfileViewState get state => _state;

  set state(ProfileViewState value) {
    _state = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("ProfileViewModel initialized");
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
      saveChanges: () {},
      toggleTheme: () async {
        final themeService = sl.get<ThemeService>();

        await themeService.setTheme(
          themeService.getTheme() == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light,
        );

        state.maybeMap(
          initial: (data) => _updateModel(
            (m) => m.copyWith(
              isDarkMode: themeService.getTheme() == ThemeMode.dark,
            ),
          ),
          orElse: () => state,
        );
      },
      logout: () {},
    );
    update();
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
