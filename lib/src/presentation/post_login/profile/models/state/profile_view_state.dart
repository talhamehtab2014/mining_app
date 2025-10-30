import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/profile_model.dart';

part 'profile_view_state.freezed.dart';

@freezed
abstract class ProfileViewState with _$ProfileViewState {
  factory ProfileViewState.initial(
   ProfileModel? profileModel
  ) = _ProfileViewInitialState;

  factory ProfileViewState.editProfile(
      ProfileModel? profileModel
      ) = _ProfileViewEditProfileState;

  factory ProfileViewState.changeTheme(
      ProfileModel? profileModel
      ) = _ProfileViewChangeThemeState;
}
