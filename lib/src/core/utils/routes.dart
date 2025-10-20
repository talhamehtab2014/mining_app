import 'package:get/get.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/bottom_navigation.dart';
import 'package:mining_application/src/presentation/post_login/history/history.dart';
import 'package:mining_application/src/presentation/post_login/home/home.dart';
import 'package:mining_application/src/presentation/post_login/profile/profile.dart';
import 'package:mining_application/src/presentation/post_login/reffrals/refferal.dart';
import 'package:mining_application/src/presentation/pre_login/onboarding_view.dart';
import 'package:mining_application/src/presentation/splash/splash_view.dart';

class Routes {
  static final Routes _instance = Routes._internal();

  factory Routes() {
    return _instance;
  }

  Routes._internal();

  String getSplashPage() => SplashView.id;

  String getOnboardingPage() => OnboardingView.id;

  String getBottomNavigationPage() => BottomNavigationView.id;

  String getHomePage() => HomeView.id;

  String getProfilePage() => ProfileView.id;

  String getHistoryPage() => HistoryView.id;

  String getReferralPage() => ReferralView.id;

  List<GetPage> get routeMap => [
    GetPage(
      name: SplashView.id,
      page: () => const SplashView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: OnboardingView.id,
      page: () => const OnboardingView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: BottomNavigationView.id,
      page: () => const BottomNavigationView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: HomeView.id,
      page: () => const HomeView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: ProfileView.id,
      page: () => const ProfileView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: HistoryView.id,
      page: () => const HistoryView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: ReferralView.id,
      page: () => const ReferralView(),
      transition: Transition.cupertino,
    ),
  ];
}
