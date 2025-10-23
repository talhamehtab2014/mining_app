import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/bottom_navigation_view_model.dart';

class BottomNavigationView extends StatefulWidget {
  static const String id = '/BottomNavigationView';

  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [R.palette.yellow900, R.palette.yellow700],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: GetBuilder<BottomNavigationViewModel>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonLabelTextWidget(
                            text: AppStrings.title,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            textColor: R.palette.primary,
                          ),
                          6.verticalSpace,
                          CommonLabelTextWidget(
                            text: '${AppStrings.welcome} User',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            textColor: R.palette.yellow500,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: R.palette.yellow700,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: R.palette.yellow500,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: R.palette.yellow500,
                              size: 18.sp,
                            ),
                            CommonLabelTextWidget(
                              text: '0.00',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              textColor: R.palette.yellow500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  6.verticalSpace,
                  CommonLabelTextWidget(
                    text: AppStrings.mineGoldBuildFortune,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    textColor: R.palette.yellow400,
                  ),
                  16.verticalSpace,
                  tabBarWidget(controller),
                ],
              ).paddingSymmetric(horizontal: 16.w, vertical: 16.h);
            },
          ),
        ),
      ),
    );
  }

  Widget tabBarWidget(BottomNavigationViewModel controller) {
    return Container(
      padding: EdgeInsets.all(4.h),
      decoration: BoxDecoration(
        color: R.palette.yellow900,

        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: controller.iconData.map((element) {
          return Expanded(
            child: statIconTile(
              element,
              isSelected:
                  controller.selectedIndex ==
                  controller.iconData.indexOf(element),
              onTap: () {
                controller.updateIndex(controller.iconData.indexOf(element));
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget statIconTile(
    IconData icon, {
    bool isSelected = false,
    VoidCallback? onTap,
    Color? background,
    Color? border,
    EdgeInsetsGeometry? padding,
    double? radius,
  }) {
    final r = (radius ?? 16).r;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(r),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r),
            color: isSelected ? (background ?? R.palette.yellow800) : null,
            border: isSelected
                ? Border.all(color: border ?? R.palette.yellow500)
                : null,
          ),
          padding: padding ?? EdgeInsets.all(4.w),
          alignment: Alignment.center,
          child: Icon(icon),
        ),
      ),
    );
  }
}
