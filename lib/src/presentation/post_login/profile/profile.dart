import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/presentation/post_login/profile/profile_view_model.dart';

class ProfileView extends GetView<ProfileViewModel> {
  static const String id = '/ProfileView';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Profile View")));
  }
}
