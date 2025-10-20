import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mining_application/my_app.dart';
import 'package:mining_application/src/core/di/di.dart';
import 'package:mining_application/src/core/enum/enums.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/core/utils/constants.dart';

import 'firebase_options.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Constants.currentEnv = AppEnv.production;
    await configureDependencies();
    R.setData();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
      ),
    );
    await ScreenUtil.ensureScreenSize();
    runApp(const MyApp());
  }, (exception, stack) {},);
}
