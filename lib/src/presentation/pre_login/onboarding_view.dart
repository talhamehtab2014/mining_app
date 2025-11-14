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
import 'package:mining_application/src/presentation/common_widgets/loading_overlay.dart';
import 'package:mining_application/src/presentation/pre_login/models/signup_request_model.dart';
import 'package:mining_application/src/presentation/pre_login/models/state/onboarding_state.dart';
import 'package:mining_application/src/presentation/pre_login/onboarding_view_model.dart';
import 'package:mining_application/src/presentation/side_effects/side_effects.dart';

import 'models/actions/onboarding_action.dart';

class OnboardingView extends StatefulWidget {
  static const String id = '/OnboardingView';

  OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneNumController = TextEditingController();

  final TextEditingController referralCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = Get.find<OnboardingViewModel>();
    ever<UiEffect?>(controller.rxEffect, (effect) {
      if (effect is ShowError) {
        Get.snackbar(
          effect.title,
          effect.message,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: R.palette.red600,
          colorText: R.palette.white
        );

        controller.onAction(OnboardingAction.updateUseEffectState());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetBuilder<OnboardingViewModel>(
        builder: (controller) {
          return controller.state.maybeWhen(
            updateState: (state, isLoading) {
              return LoadingOverlay(
                isLoading: isLoading,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Theme.of(context).colorScheme.onSurface,
                        Theme.of(context).colorScheme.surface,
                      ], // dark
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
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        _buildTabButton(
                                          context: context,
                                          title: AppStrings.login,
                                          isSelected:
                                              state ==
                                              OnboardingStateEnum.login,
                                          onTap: () {
                                            resetFields();
                                            controller.onAction(
                                              OnboardingAction.loginRadioButton(),
                                            );
                                          },
                                        ),
                                        8.horizontalSpace,
                                        _buildTabButton(
                                          context: context,
                                          title: AppStrings.signup,
                                          isSelected:
                                              state ==
                                              OnboardingStateEnum.signup,
                                          onTap: () {
                                            resetFields();
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
                                            callback: () {
                                              controller.onAction(
                                                OnboardingAction.loginWithGoogle(),
                                              );
                                            },
                                            borderRadius: 6.r,
                                            iconWidget: FaIcon(
                                              FontAwesomeIcons.google,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        // 8.horizontalSpace,
                                        // Expanded(
                                        //   child: ButtonWithRadiusWidget(
                                        //     buttonTitle: AppStrings.phone,
                                        //     callback: () {
                                        //       controller.onAction(
                                        //         OnboardingAction.loginWithPhone(),
                                        //       );
                                        //     },
                                        //     borderRadius: 6.r,
                                        //     iconWidget: FaIcon(
                                        //       FontAwesomeIcons.phone,
                                        //       size: 16,
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
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
                ),
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }

  Widget _buildTabButton({
    required BuildContext context,
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
            color: isSelected
                ? R.palette.primary
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: isSelected ? R.palette.primary : R.palette.borderOrDivider,
            ),
          ),
          child: CommonLabelTextWidget(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            textColor: isSelected
                ? R.palette.blackColor
                : Theme.of(context).colorScheme.tertiary,
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
          controller: emailController,
          hintText: AppStrings.emailHint,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.passwordLabel,
          controller: passwordController,
          hintText: AppStrings.passwordHint,
          isPassword: true,
        ),
        16.verticalSpace,
        ButtonWithRadiusWidget(
          buttonTitle: AppStrings.loginWithEmail,
          callback: () {
            controller.onAction(
              OnboardingAction.loginWithEmail(
                emailController.text,
                passwordController.text,
              ),
            );
          },
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
          controller: nameController,
          hintText: AppStrings.nameHint,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.emailLabel,
          controller: emailController,
          hintText: AppStrings.emailHint,
          keyboardType: TextInputType.emailAddress,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.passwordLabel,
          controller: passwordController,
          hintText: AppStrings.passwordHint,
          isPassword: true,
        ),
        16.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.phoneOptional,
          controller: phoneNumController,
          hintText: AppStrings.phoneOptionalHint,
          keyboardType: TextInputType.phone,
        ),
        12.verticalSpace,
        CommonTextFieldWidget(
          labelText: AppStrings.referral,
          controller: referralCodeController,
          hintText: AppStrings.referralHint,
        ),
        16.verticalSpace,
        ButtonWithRadiusWidget(
          buttonTitle: AppStrings.signUpWithEmail,
          callback: () {
            SignupRequestModel reqModel = SignupRequestModel(
              strEmail: emailController.text,
              strName: nameController.text,
              strPassword: passwordController.text,
              strPhoneNumber: phoneNumController.text,
              strReferralCode: referralCodeController.text,
            );

            controller.onAction(OnboardingAction.signupWithEmail(reqModel));
          },
          borderRadius: 6.r,
          iconWidget: FaIcon(FontAwesomeIcons.envelope),
        ),
      ],
    );
  }

  void resetFields() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    phoneNumController.clear();
    referralCodeController.clear();
  }
}
