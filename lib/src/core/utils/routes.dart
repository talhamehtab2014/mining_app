import 'package:get/get.dart';
import 'package:mining_application/src/presentation/splash/splash_view.dart';

class Routes {
  static final Routes _instance = Routes._internal();

  factory Routes() {
    return _instance;
  }

  Routes._internal();

  String getSplashPage() => SplashView.id;

  List<GetPage> get routeMap => [
    GetPage(
      name: SplashView.id,
      page: () => const SplashView(),
      transition: Transition.cupertino,
    ),
  ];
}
