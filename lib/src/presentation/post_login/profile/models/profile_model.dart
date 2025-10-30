import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';


@freezed
abstract class ProfileModel with _$ProfileModel {

  const factory ProfileModel({
    bool? isProfileEdited,
    bool? isDarkMode,
    String? username,
    String? email,
    String? phoneNumber,
  }) = _ProfileModel;
}
