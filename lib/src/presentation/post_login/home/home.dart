import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/post_login/home/home_view_model.dart';

class HomeView extends GetView<HomeViewModel> {
  static const String id = '/HistoryView';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(child: Text("Home View")),
    );
  }
}
