import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/pre_login/onboarding_view_model.dart';

class OnboardingView extends GetView<OnboardingViewModel> {
  static const String id = '/OnboardingView';
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(controller.title),
      ),
    );
  }
}
