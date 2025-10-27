import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_button_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/post_login/reffrals/refferal_view_model.dart';

class ReferralView extends GetView<ReferralViewModel> {
  static const String id = '/ReferralView';

  const ReferralView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: referralTopHeaderCard(AppStrings.totalReferrals, "0"),
                ),
                8.horizontalSpace,
                Expanded(
                  child: referralTopHeaderCard(AppStrings.earned, "0 AU"),
                ),
              ],
            ),
            16.verticalSpace,
            referralCodeWidget(),
            24.verticalSpace,
            referralInfoCard(
              AppStrings.referralRewards,
              AppStrings.referralRewardsDetails,
            ),
            16.verticalSpace,
            yourReferralCard('${AppStrings.yourReferrals}(0)'),
          ],
        ),
      ),
    );
  }

  Widget referralTopHeaderCard(String title, String value) {
    return Container(
      height: 90.h,
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
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            textColor: R.palette.yellow500,
          ),
          Spacer(),
          CommonLabelTextWidget(
            text: value,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            textColor: R.palette.yellow500,
          ),
        ],
      ),
    );
  }

  Widget referralCodeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        8.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: R.palette.yellow700,
                blurRadius: 12,
                spreadRadius: 3,
                offset: const Offset(0, 4),
              ),
            ],
            gradient: LinearGradient(
              colors: [R.palette.yellow700, R.palette.yellow900],
              end: AlignmentGeometry.bottomRight,
              begin: AlignmentGeometry.topLeft,
            ),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: R.palette.yellow500),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonLabelTextWidget(
                text: AppStrings.yourReferralCode,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                textColor: R.palette.yellow200,
              ),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: R.palette.yellow600),
                      ),
                      child: CommonLabelTextWidget(
                        text: 'AU12345',
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        textColor: R.palette.yellow300,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: R.palette.yellow600,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: R.palette.yellow600),
                    ),
                    child: Icon(
                      Icons.copy,
                      color: R.palette.yellow300,
                      size: 16,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              ButtonWithRadiusWidget(
                callback: () {},
                buttonTitle: AppStrings.shareReferralCode,
                borderRadius: 10,
                iconWidget: Icon(Icons.share),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget referralInfoCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: R.palette.yellow900,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: R.palette.yellow500),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonLabelTextWidget(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            textColor: R.palette.yellow200,
          ),
          24.verticalSpace,
          CommonLabelTextWidget(
            text: value,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            textColor: R.palette.yellow300,
            maxLines: 4,
            textHeight: 1.5,
          ),
        ],
      ),
    );
  }

  Widget yourReferralCard(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonLabelTextWidget(
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          textColor: R.palette.yellow200,
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: R.palette.yellow900,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: R.palette.yellow500),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.people_alt_outlined,
                  size: 48,
                  color: R.palette.yellow300,
                ),
                16.verticalSpace,
                CommonLabelTextWidget(
                  text: AppStrings.noReferralYet,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  textColor: R.palette.yellow100,
                ),
                16.verticalSpace,
                CommonLabelTextWidget(
                  text: AppStrings.shareYourCode,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  textColor: R.palette.yellow300,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
