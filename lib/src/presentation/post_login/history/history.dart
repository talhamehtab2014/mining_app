import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/post_login/history/history_view_model.dart';

class HistoryView extends GetView<HistoryViewModel> {
  static const String id = '/HistoryView';

  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: historyTopHeaderCard(
                  context,
                  AppStrings.totalMined,
                  "0.00 AU",
                ),
              ),
              8.horizontalSpace,
              Expanded(
                child: historyTopHeaderCard(context, AppStrings.sessions, "0"),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 22,
                color: Theme.of(context).colorScheme.onPrimaryFixed,
              ),
              8.horizontalSpace,
              CommonLabelTextWidget(
                text: AppStrings.miningHistory,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                textColor: Theme.of(context).colorScheme.onSecondaryFixed,
              ),
            ],
          ),
          16.verticalSpace,
          noMiningHistoryCard(context),
        ],
      ),
    );
  }

  Widget historyTopHeaderCard(
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

  Widget noMiningHistoryCard(BuildContext context) {
    return Container(
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
              Icons.history,
              size: 48,
              color: Theme.of(context).colorScheme.onSecondaryFixed,
            ),
            24.verticalSpace,
            CommonLabelTextWidget(
              text: AppStrings.noMiningHistory,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              textColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            ),
            24.verticalSpace,
            CommonLabelTextWidget(
              text: AppStrings.startMiningNow,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              textColor: Theme.of(context).colorScheme.onSecondaryFixed,
            ),
          ],
        ),
      ),
    );
  }
}
