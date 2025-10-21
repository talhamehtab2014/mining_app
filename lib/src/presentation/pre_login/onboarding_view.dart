import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/localization/app_strings.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_button_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/common_widgets/common_text_field_widget.dart';
import 'package:mining_application/src/presentation/pre_login/models/state/onboarding_state.dart';
import 'package:mining_application/src/presentation/pre_login/onboarding_view_model.dart';

import 'models/actions/onboarding_action.dart';

class OnboardingView extends StatelessWidget {
  static const String id = '/OnboardingView';

  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [R.palette.yellow900, R.palette.yellow800],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  22.verticalSpace,
                  CommonLabelTextWidget(
                    text: AppStrings.title,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    textColor: R.palette.primary,
                  ),
                  6.verticalSpace,
                  CommonLabelTextWidget(
                    text: AppStrings.subtitleOnboarding,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    textColor: R.palette.primary,
                  ),

                  Container(
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: R.palette.cardBackground.withAlpha(150),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: GetBuilder<OnboardingViewModel>(
                      builder: (controller) {
                        return controller.state.maybeWhen(
                          updateState: (state) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    _buildTabButton(
                                      title: AppStrings.login,
                                      isSelected:
                                          state == OnboardingStateEnum.login,
                                      onTap: () {
                                        controller.onAction(
                                          OnboardingAction.loginRadioButton(),
                                        );
                                      },
                                    ),
                                    8.horizontalSpace,
                                    _buildTabButton(
                                      title: AppStrings.signup,
                                      isSelected:
                                          state == OnboardingStateEnum.signup,
                                      onTap: () {
                                        controller.onAction(
                                          OnboardingAction.signupRadioButton(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                18.verticalSpace,
                                state == OnboardingStateEnum.login
                                    ? loginTabWidget(controller)
                                    : signUpTabWidget(controller),
                                16.verticalSpace,
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: R.palette.borderOrDivider,
                                      ),
                                    ),
                                    CommonLabelTextWidget(
                                      text: AppStrings.orContinueWith,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      textColor: R.palette.primary,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: R.palette.borderOrDivider,
                                      ),
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
                                        borderRadius: 6.r,
                                        iconWidget: FaIcon(
                                          FontAwesomeIcons.google,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Expanded(
                                      child: ButtonWithRadiusWidget(
                                        buttonTitle: AppStrings.phone,
                                        callback: () {},
                                        borderRadius: 6.r,
                                        iconWidget: FaIcon(
                                          FontAwesomeIcons.phone,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          orElse: () {
                            return Container();
                          },
                        );
                      },
                    ),
                  ),

                  CommonLabelTextWidget(
                    text: AppStrings.consent,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    textColor: R.palette.primary,
                  ),
                ],
              ).marginOnly(bottom: 16.h),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? R.palette.primary : R.palette.transparent,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: isSelected ? R.palette.primary : R.palette.borderOrDivider,
            ),
          ),
          child: CommonLabelTextWidget(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            textColor: isSelected ? R.palette.blackColor : R.palette.white,
          ),
        ),
      ),
    );
  }

  Widget loginTabWidget(OnboardingViewModel controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonTextFieldWidget(
          labelText: AppStrings.emailLabel,
          controller: TextEditingController(),
          hintText: AppStrings.emailHint,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.passwordLabel,
          controller: TextEditingController(),
          hintText: AppStrings.passwordHint,
          isPassword: true,
        ),
        8.verticalSpace,
        ButtonWithRadiusWidget(
          buttonTitle: AppStrings.loginWithEmail,
          callback: () {},
          borderRadius: 6.r,
          iconWidget: FaIcon(FontAwesomeIcons.envelope),
        ),
      ],
    );
  }

  Widget signUpTabWidget(OnboardingViewModel controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonTextFieldWidget(
          labelText: AppStrings.name,
          controller: TextEditingController(),
          hintText: AppStrings.nameHint,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.emailLabel,
          controller: TextEditingController(),
          hintText: AppStrings.emailHint,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.passwordLabel,
          controller: TextEditingController(),
          hintText: AppStrings.passwordHint,
          isPassword: true,
        ),
        16.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.phoneOptional,
          controller: TextEditingController(),
          hintText: AppStrings.phoneOptionalHint,
          keyboardType: TextInputType.phone,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.referral,
          controller: TextEditingController(),
          hintText: AppStrings.referralHint,
        ),
        8.verticalSpace,
        ButtonWithRadiusWidget(
          buttonTitle: AppStrings.signUpWithEmail,
          callback: () {
            controller.onAction(OnboardingAction.signUpWithEmail());
          },
          borderRadius: 6.r,
          iconWidget: FaIcon(FontAwesomeIcons.envelope),
        ),
      ],
    );
  }
}
