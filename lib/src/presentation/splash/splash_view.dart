import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/splash/splash_view_model.dart';

class SplashView extends GetView<SplashViewModel> {
  static const String id = '/SplashView';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(controller.title, style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
