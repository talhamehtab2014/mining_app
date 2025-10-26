import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/shake_scale_animation_widget.dart';
import 'package:mining_application/src/presentation/post_login/home/home_view_model.dart';

class HomeView extends GetView<HomeViewModel> {
  static const String id = '/HistoryView';

  const HomeView({super.key});

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
                  child: homeTopHeaderCard('Mining Rate', '1.00 AU/mine'),
                ),
                8.horizontalSpace,
                Expanded(
                  child: homeTopHeaderCard('Mining Rate', '1.00 AU/mine'),
                ),
              ],
            ),

            32.verticalSpace,

            SeesawZoom(
              runFor: const Duration(seconds: 10),
              period: const Duration(milliseconds: 1200),
              maxDegrees: 12,
              minScale: 0.92,
              maxScale: 1.0,
              autoStart: false,
              startOnTap: true,
              onStart: () {
                print("onstart");
              },
              onStop: () {
                print("onend");
              },
              child: Container(
                height: 200.h,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  color: R.palette.amber500,
                  border: Border.all(color: R.palette.yellow500),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/ic_pickaxe.png',
                      height: 32,
                      width: 32,
                    ),
                    16.verticalSpace,
                    CommonLabelTextWidget(
                      text: 'Start Mining',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      textColor: R.palette.yellow900,
                    ),
                  ],
                ),
              ),
            ),

            32.verticalSpace,

            homeBottomInfoCard('How Mining Works', '''
• Tap "Start Mining" to begin your mining session
• Each mining session takes 3 seconds to complete
• You can mine once every 24 hours
• Refer friends to increase your mining rate (+0.5 AU per referral)
• AU tokens will be convertible to blockchain tokens at launch
          '''),
          ],
        ),
      ),
    );
  }

  Widget homeTopHeaderCard(String title, String value) {
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

  Widget homeBottomInfoCard(String title, String value) {
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
            maxLines: 9,
            textHeight: 1.5,
          ),
        ],
      ),
    );
  }
}
