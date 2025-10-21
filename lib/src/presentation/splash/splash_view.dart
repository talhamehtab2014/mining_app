import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';
import 'package:mining_application/src/presentation/splash/splash_view_model.dart';

class SplashView extends GetView<SplashViewModel> {
  static const String id = '/SplashView';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonLabelTextWidget(
          text: controller.title,
          fontWeight: FontWeight.w600,
          fontSize: 58.sp,
          textColor: Colors.amber,
        ),
      ),
    );
  }
}
