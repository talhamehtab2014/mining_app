import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_view_action.freezed.dart';

@freezed
abstract class ProfileViewAction with _$ProfileViewAction {
  const factory ProfileViewAction.editProfile(bool isEditable) = EditProfileAction;

  const factory ProfileViewAction.saveChanges(
      {String? name, String? email, String? phoneNo}) = SaveChangesAction;


  const factory ProfileViewAction.toggleTheme() = ToggleThemeAction;

  const factory ProfileViewAction.logout() = LogoutAction;
}
