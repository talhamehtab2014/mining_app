import 'package:get/get.dart';
import 'package:mining_application/src/core/di/di.dart';
import 'package:mining_application/src/domain/usecase/onboarding/onboarding_signin_usecase.dart';
import 'package:mining_application/src/domain/usecase/onboarding/onboarding_signup_usecase.dart';
import 'package:mining_application/src/domain/usecase/onboarding/onboarding_signup_with_google_usecase.dart';
import 'package:mining_application/src/presentation/post_login/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:mining_application/src/presentation/post_login/history/history_view_model.dart';
import 'package:mining_application/src/presentation/post_login/home/home_view_model.dart';
import 'package:mining_application/src/presentation/post_login/profile/profile_view_model.dart';
import 'package:mining_application/src/presentation/post_login/reffrals/refferal_view_model.dart';
import 'package:mining_application/src/presentation/pre_login/onboarding_view_model.dart';
import 'package:mining_application/src/presentation/splash/splash_view_model.dart';

class GlobalDependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewModel>(() => SplashViewModel(), fenix: true);
    Get.lazyPut<OnboardingViewModel>(
      () => OnboardingViewModel(
        onboardingSignInUseCase: sl.get<OnboardingSignInUseCase>(),
        onboardingSignUpUseCase: sl.get<OnboardingSignUpUseCase>(),
        onboardingSignUpWithGoogleUseCase: sl
            .get<OnboardingSignUpWithGoogleUseCase>(),
      ),
      fenix: true,
    );
    Get.lazyPut<BottomNavigationViewModel>(
      () => BottomNavigationViewModel(fetchLocalDataUseCase: sl.get()),
      fenix: true,
    );
    Get.lazyPut<HomeViewModel>(() => HomeViewModel(), fenix: true);
    Get.lazyPut<ProfileViewModel>(
      () => ProfileViewModel(
        updateDataUseCase: sl.get(),
        getUserDataUseCase: sl.get(),
        fetchLocalDataUseCase: sl.get(),
        themeService: sl.get(),
      ),
      fenix: true,
    );
    Get.lazyPut<ReferralViewModel>(() => ReferralViewModel(), fenix: true);
    Get.lazyPut<HistoryViewModel>(() => HistoryViewModel(), fenix: true);
  }
}
