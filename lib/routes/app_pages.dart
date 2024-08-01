// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:mobilegarage/app/auth/signup/signup_binding.dart';
import 'package:mobilegarage/app/auth/signup/signup_view.dart';
import 'package:mobilegarage/app/home/home_binding.dart';
import 'package:mobilegarage/app/home/home_view.dart';
import 'package:mobilegarage/app/onboarding/onboarding_binding.dart';
import 'package:mobilegarage/app/onboarding/onboarding_view.dart';
import 'package:mobilegarage/app/profile/account_binding.dart';
import 'package:mobilegarage/app/profile/account_view.dart';
import 'package:mobilegarage/app/profile/edit_profile/edit_profile_binding.dart';
import 'package:mobilegarage/app/profile/edit_profile/edit_profile_view.dart';
import 'package:mobilegarage/app/select_lang/select_language_binding.dart';
import 'package:mobilegarage/app/select_lang/select_language_view.dart';
import 'package:mobilegarage/app/splash/splash_binding.dart';
import 'package:mobilegarage/app/splash/splash_view.dart';
import 'package:mobilegarage/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    //TODO:  [Splash Route]
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [selectlang Route]
    GetPage(
      name: AppRoutes.selectlang,
      page: () => const SelectLanguageView(),
      binding: SelectLanguageBinding(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    // //TODO:  [onboaring Route]
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [signup Route]
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO:  [Home Route]
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

      //TODO:  [Account Route]
    GetPage(
      name: AppRoutes.account,
      page: () => const AccountView(),
      binding: AccountBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

          //TODO:  [Edit Profile Route]
    GetPage(
      name: AppRoutes.editprofile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
  ];
}
