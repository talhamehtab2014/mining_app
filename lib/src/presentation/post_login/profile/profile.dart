import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/core/utils/routes.dart';
import 'package:mining_application/src/presentation/common_widgets/common_button_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/post_login/profile/profile_view_model.dart';

class ProfileView extends GetView<ProfileViewModel> {
  static const String id = '/ProfileView';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          16.verticalSpace,
          profileTopHeaderCard(),
          16.verticalSpace,
          logoutButton(context),
        ],
      ),
    );
  }

  Widget profileTopHeaderCard() {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: R.palette.yellow900,
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
            textColor: R.palette.yellow100,
          ),
          32.verticalSpace,
          versionRowItem(AppStrings.version, "1.0.0 (MVP)"),
          8.verticalSpace,
          versionRowItem(AppStrings.miningCycle, '24 Hours'),
          8.verticalSpace,
          versionRowItem(AppStrings.tokenSymbol, 'AU'),
        ],
      ),
    );
  }

  Widget versionRowItem(title, value) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CommonLabelTextWidget(
        text: title,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        textColor: R.palette.yellow300,
      ),
      CommonLabelTextWidget(
        text: value,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        textColor: R.palette.yellow100,
      ),
    ],
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
            backgroundColor: R.palette.yellow950,
            child: Container(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonLabelTextWidget(
                    text: 'Are you sure you want to logout?',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    textColor: R.palette.yellow100,
                  ),
                  16.verticalSpace,
                  CommonLabelTextWidget(
                    text: 'You\'ll need to login again to access your account.',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    textColor: R.palette.yellow300,
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
          color: R.palette.yellow900,
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
