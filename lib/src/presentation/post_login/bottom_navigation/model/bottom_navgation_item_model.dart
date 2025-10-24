import 'package:flutter/cupertino.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/action/bottom_navigation_action.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/model/bottom_navigation_state.dart';

class BottomNavigationItemModel {
  final BottomNavigationAction action;
  final BottomNavigationState state;
  final IconData iconPath;

  BottomNavigationItemModel({
    required this.iconPath,
    required this.state,
    required this.action,
  });
}