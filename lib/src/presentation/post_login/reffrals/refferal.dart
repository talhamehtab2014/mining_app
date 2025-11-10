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
                  child: referralTopHeaderCard(
                    context,
                    AppStrings.totalReferrals,
                    "0",
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: referralTopHeaderCard(
                    context,
                    AppStrings.earned,
                    "0 AU",
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w),
            16.verticalSpace,
            referralCodeWidget(context).paddingSymmetric(horizontal: 16.w),
            24.verticalSpace,
            referralInfoCard(
              context,
              AppStrings.referralRewards,
              AppStrings.referralRewardsDetails,
            ).paddingSymmetric(horizontal: 16.w),
            16.verticalSpace,
            yourReferralCard(
              context,
              '${AppStrings.yourReferrals}(0)',
            ).paddingSymmetric(horizontal: 16.w),
          ],
        ),
      ),
    );
  }

  Widget referralTopHeaderCard(
    BuildContext context,
    String title,
    String value,
  ) {
    return Container(
      height: 90.h,
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
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            textColor: Theme.of(context).colorScheme.onPrimaryFixed,
          ),
          Spacer(),
          CommonLabelTextWidget(
            text: value,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            textColor: Theme.of(context).colorScheme.onPrimaryFixed,
          ),
        ],
      ),
    );
  }

  Widget referralCodeWidget(BuildContext context) {
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
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                blurRadius: 12,
                spreadRadius: 3,
                offset: const Offset(0, 4),
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onPrimaryContainer,
                Theme.of(context).colorScheme.onSurface,
              ],
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
                textColor: Theme.of(
                  context,
                ).colorScheme.onSecondaryFixedVariant,
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
                        textColor: Theme.of(
                          context,
                        ).colorScheme.onSecondaryFixed,
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

  Widget referralInfoCard(BuildContext context, String title, String value) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
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
            textColor: Theme.of(context).colorScheme.onSecondaryFixedVariant,
          ),
          24.verticalSpace,
          CommonLabelTextWidget(
            text: value,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            textColor: Theme.of(context).colorScheme.onSecondaryFixed,
            maxLines: 4,
            textHeight: 1.5,
          ),
        ],
      ),
    );
  }

  Widget yourReferralCard(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonLabelTextWidget(
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          textColor: Theme.of(context).colorScheme.onSecondaryFixedVariant,
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).colorScheme.onSecondaryFixed,
                ),
                16.verticalSpace,
                CommonLabelTextWidget(
                  text: AppStrings.noReferralYet,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  textColor: Theme.of(
                    context,
                  ).colorScheme.onPrimaryFixedVariant,
                ),
                16.verticalSpace,
                CommonLabelTextWidget(
                  text: AppStrings.shareYourCode,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  textColor: Theme.of(context).colorScheme.onSecondaryFixed,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
