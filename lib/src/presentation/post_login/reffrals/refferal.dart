import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/post_login/reffrals/refferal_view_model.dart';

class ReferralView extends GetView<ReferralViewModel> {
  static const String id = '/ReferralView';

  const ReferralView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Referral View")));
  }
}
