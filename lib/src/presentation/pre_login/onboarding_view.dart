import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_button_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_text_field_widget.dart';
import 'package:mining_application/src/presentation/pre_login/onboarding_view_model.dart';

class OnboardingView extends GetView<OnboardingViewModel> {
  static const String id = '/OnboardingView';

  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonLabelTextWidget(
                text: AppStrings.title,
                fontWeight: FontWeight.w600,
                fontSize: 28.sp,
                textColor: R.palette.primary,
              ),
              6.verticalSpace,
              CommonLabelTextWidget(
                text: AppStrings.subtitleOnboarding,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                textColor: R.palette.primary,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(16.w),
                margin: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: R.palette.cardBackground,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWithRadiusWidget(
                            buttonTitle: "Login",
                            callback: () {},
                            borderRadius: 10.r,
                          ),
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: ButtonWithRadiusWidget(
                            buttonTitle: "Sign Up",
                            callback: () {},
                            borderRadius: 10.r,
                          ),
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    CommonTextFieldWidget(
                      labelText: AppStrings.emailLabel,
                      controller: TextEditingController(),
                      hintText: AppStrings.emailHint,
                    ),
                    6.verticalSpace,
                    CommonTextFieldWidget(
                      labelText: AppStrings.passwordLabel,
                      controller: TextEditingController(),
                      hintText: AppStrings.passwordHint,
                    ),
                    6.verticalSpace,
                    ButtonWithRadiusWidget(
                      buttonTitle: AppStrings.loginWithEmail,
                      callback: () {},
                      borderRadius: 10.r,
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Container(height: 1, color: R.palette.borderOrDivider),
                        ),
                        CommonLabelTextWidget(
                          text: AppStrings.orContinueWith,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          textColor: R.palette.primary,
                        ),
                        Expanded(
                          child: Container(height: 1, color: R.palette.borderOrDivider),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWithRadiusWidget(
                            buttonTitle: AppStrings.google,
                            callback: () {},
                            borderRadius: 10.r,
                          ),
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: ButtonWithRadiusWidget(
                            buttonTitle: AppStrings.phone,
                            callback: () {},
                            borderRadius: 10.r,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              CommonLabelTextWidget(
                text: AppStrings.consent,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                textColor: R.palette.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
