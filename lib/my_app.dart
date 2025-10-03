import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mining_application/src/core/localization/app_translations.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/core/utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations,
        GlobalCupertinoLocalizations;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: false,
      builder: (context, child) => getMaterialApp,
    );
  }

  Widget get getMaterialApp => GetMaterialApp(
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: const TextScaler.linear(1)),
        child: child!,
      );
    },
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [const Locale('en', 'US')],
    navigatorKey: navigatorKey,
    locale: Locale('en', 'US'),
    debugShowCheckedModeBanner: false,
    translations: AppTranslations(),
    initialRoute: Routes().getSplashPage(),
    getPages: Routes().routeMap,
    theme: R.themeData,
    themeMode: ThemeMode.light,
    smartManagement: SmartManagement.full,
    // initialBinding: InitialBinding(),
  );
}
