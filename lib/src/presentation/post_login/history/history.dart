import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/post_login/history/history_view_model.dart';

class HistoryView extends GetView<HistoryViewModel> {
  static const String id = '/HistoryView';

  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("History View")));
  }
}
