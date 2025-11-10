import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/core/utils/routes.dart';
import 'package:mining_application/src/presentation/common_widgets/common_button_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_text_field_widget.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/action/profile_view_action.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/profile_model.dart';
import 'package:mining_application/src/presentation/post_login/profile/models/state/profile_view_state.dart';
import 'package:mining_application/src/presentation/post_login/profile/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  static const String id = '/ProfileView';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: controller.state.maybeWhen(
              initial: (state) => Column(
                children: [
                  editProfileCard(context, controller, state),
                  16.verticalSpace,
                  darkLightSwitcher(context, state),
                  16.verticalSpace,
                  profileTopHeaderCard(context),
                  16.verticalSpace,
                  logoutButton(context),
                ],
              ),
              orElse: () => Container(),
            ),
          ),
        );
      },
    );
  }

  Widget editProfileCard(
    BuildContext context,
    ProfileViewModel controller,
    ProfileModel? state,
  ) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: R.palette.yellow500),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonLabelTextWidget(
                text: AppStrings.profileInformation,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                textColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
              ),
              state?.isProfileEdited == true
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        actionButtons(
                          false,
                          AppStrings.cancel,
                          () {
                            controller.onAction(
                              ProfileViewAction.editProfile(
                                !(state?.isProfileEdited ?? false),
                              ),
                            );
                          },
                          R.palette.red600,
                          null,
                        ),
                        6.horizontalSpace,
                        actionButtons(
                          false,
                          AppStrings.save,
                          () {},
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.tertiary,
                        ),
                      ],
                    )
                  : actionButtons(
                      true,
                      AppStrings.edit,
                      () {
                        controller.onAction(
                          ProfileViewAction.editProfile(
                            !(state?.isProfileEdited ?? false),
                          ),
                        );
                      },
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.onTertiary,
                    ),
            ],
          ),
          16.verticalSpace,
          CommonTextFieldWidget(
            labelText: AppStrings.name,
            controller: TextEditingController(text: '${state?.username}'),
            hintText: AppStrings.nameHint,
            isEnabled: state?.isProfileEdited ?? true,
          ),
          12.verticalSpace,
          CommonTextFieldWidget(
            labelText: AppStrings.emailLabel,
            controller: TextEditingController(text: '${state?.email}'),
            hintText: AppStrings.emailHint,
            isEnabled: state?.isProfileEdited ?? true,
          ),
          12.verticalSpace,
          CommonTextFieldWidget(
            labelText: AppStrings.phone,
            controller: TextEditingController(text: '${state?.phoneNumber}'),
            hintText: AppStrings.phoneOptionalHint,
            isEnabled: state?.isProfileEdited ?? true,
          ),
        ],
      ),
    );
  }

  Widget darkLightSwitcher(BuildContext context, ProfileModel? state) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: R.palette.yellow500),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonLabelTextWidget(
                text: AppStrings.appearance,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                textColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
              ),
              12.verticalSpace,
              CommonLabelTextWidget(
                text: false ? AppStrings.light : AppStrings.dark,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                textColor: Theme.of(context).colorScheme.onSecondaryFixed,
              ),
            ],
          ),
          8.horizontalSpace,
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [R.palette.yellow500, R.palette.yellow700],
                ),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: R.palette.yellow500),
              ),
              child: Icon(
                true ? Icons.wb_sunny_outlined : Icons.nightlight_round,
                color: R.palette.yellow950,
                size: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileTopHeaderCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: R.palette.yellow500),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonLabelTextWidget(
            text: AppStrings.aboutAUMining,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            textColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
          ),
          32.verticalSpace,
          versionRowItem(context, AppStrings.version, "1.0.0 (MVP)"),
          8.verticalSpace,
          versionRowItem(context, AppStrings.miningCycle, '24 Hours'),
          8.verticalSpace,
          versionRowItem(context, AppStrings.tokenSymbol, 'AU'),
        ],
      ),
    );
  }

  Widget versionRowItem(BuildContext context, title, value) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CommonLabelTextWidget(
        text: title,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        textColor: Theme.of(context).colorScheme.onSecondaryFixed,
      ),
      CommonLabelTextWidget(
        text: value,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        textColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
      ),
    ],
  );

  Widget actionButtons(
    bool isIconRequired,
    String title,
    VoidCallback callback,
    Color color,
    Color? textColor,
  ) => GestureDetector(
    onTap: callback,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: R.palette.yellow500),
      ),
      child: Row(
        children: [
          if (isIconRequired) ...[
            Icon(Icons.edit_outlined, color: R.palette.yellow500, size: 14.sp),
            6.horizontalSpace,
          ],
          CommonLabelTextWidget(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            textColor: textColor ?? R.palette.yellow100,
          ),
        ],
      ),
    ),
  );

  Widget logoutButton(context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          Dialog(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: R.palette.yellow500),
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            child: Container(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonLabelTextWidget(
                    text: 'Are you sure you want to logout?',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    textColor: Theme.of(
                      context,
                    ).colorScheme.onPrimaryFixedVariant,
                  ),
                  16.verticalSpace,
                  CommonLabelTextWidget(
                    text: 'You\'ll need to login again to access your account.',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    textColor: Theme.of(context).colorScheme.onSecondaryFixed,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    textHeight: 1.2,
                  ),
                  16.verticalSpace,
                  ButtonWithRadiusWidget(
                    buttonTitle: AppStrings.logout,
                    backColor: R.palette.red600,
                    borderRadius: 8.r,
                    callback: () {
                      Get.offAllNamed(Routes().getOnboardingPage());
                    },
                  ),
                  16.verticalSpace,
                  ButtonWithRadiusWidget(
                    buttonTitle: AppStrings.cancel,
                    backColor: R.palette.yellow900,
                    borderRadius: 8.r,
                    callback: () {
                      navigator?.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          border: Border.all(color: R.palette.blackColor, width: 0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout, color: R.palette.red600),
            8.horizontalSpace,
            CommonLabelTextWidget(
              text: AppStrings.logout,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              textColor: R.palette.red600,
            ),
          ],
        ),
      ),
    );
  }
}
