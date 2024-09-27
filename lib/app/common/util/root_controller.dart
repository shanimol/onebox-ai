// import 'package:get/get.dart';
// import 'package:infinyte/app/common/analytics/tracker/custom_tracker.dart';
// import 'package:infinyte/app/common/constants/preferences.dart';
// import 'package:infinyte/app/common/service/storage_service.dart';
// import 'package:infinyte/app/data/models/user/user.dart';
// import 'package:infinyte/app/data/repository/onboarding/onboarding_repository.dart';
// import 'package:infinyte/app/routes/app_pages.dart';
//
// class RootController {
//   RootController._();
//
//   static Future<String> getInitialPage() async {
//     ///FlutterSecureStorage stores any info in the keychain,
//     ///the data doesn't get deleted even if the app is uninstalled.
//     ///Below code clear the secure storage when opening the app for the first time
//     if (StorageService.box.getValue(Preferences.isFirstTimeRun) ?? true) {
//       await StorageService.box.clearSecureStorage();
//
//       /// Moving this to welcome screen controller. When opening via deeplink this code is executed first which sets first time run as false.
//       /// When deeplink navigation is done this check will return false and intro screen will be popped and navigated to welcom page.
//       // await StorageService.box.saveValue(Preferences.isFirstTimeRun, false);
//     }
//
//     //  await getAndStoreSettings();
//
//     if (await isSoftLogout()) {
//       return Routes.SOFT_LOGIN;
//     }
//     if (await isTokenPresent()) {
//       // if (await isOnboarded() && await isIdentityCheckCompleted()) {
//       //   if (await BiometricAuthenticationHandler.instance.canAuthenticate &&
//       //       StorageService.box.isBiometricEnabled() &&
//       //       StorageService.box.isBiometricPermissionGranted()) {
//       //     CustomTracker.shared
//       //         .biometricLoginPageViewed(route: Routes.BIOMETRIC_AUTHENTICATION);
//       //     return Routes.BIOMETRIC_AUTHENTICATION;
//       //   } else {
//       //     return Routes.HOME;
//       //   }
//       // }
//       if (await isOnboarded()) {
//         return Routes.HOME;
//       }
//
//       return await getOnBoardingPage() ?? Routes.RETRY;
//     }
//     if (await hasIntroScreenShown()) {
//       return Routes.WELCOME_SCREEN;
//     }
//     return Routes.LAUNCH_SCREEN;
//   }
//
//   static Future<bool> isSoftLogout() async {
//     try {
//       return (await isTokenPresent() &&
//           StorageService.box.getUserDetails()?.onboardingState !=
//               OnBoardingStatus.onboarded);
//     } catch (e) {}
//     return false;
//   }
//
//   static Future<bool> isTokenPresent() async {
//     final accessToken = await StorageService.box.getAuthToken();
//     if (accessToken == null || accessToken.isEmpty) {
//       return false;
//     }
//     return true;
//   }
//
//   static Future<bool> isOnboarded() async {
//     return await StorageService.box.getValue(Preferences.isOnboarded) ?? false;
//   }
//
//   static Future<bool> isIdentityCheckCompleted() async {
//     var isTrue = await StorageService.box
//             .getValue(Preferences.isIdentityCheckCompleted) ??
//         false;
//     if (isTrue) {
//       return true;
//     } else {
//       await StorageService.box.saveValue(Preferences.isOnboarded, false);
//
//       return false;
//     }
//   }
//
//   static Future<bool> hasIntroScreenShown() async {
//     return await StorageService.box.getValue(Preferences.hasIntroScreenShown) ??
//         false;
//   }
//
//   static Future<void> getAndStoreSettings() async {
//     await OnboardingRepository().getAndStoreReachOutSettings();
//   }
//
//   static Future<String?> getOnBoardingPage({String? fromRoute}) async {
//     final result = await OnboardingRepository().getCurrentUser();
//     String? page;
//     await result.fold((l) {
//       CustomTracker.shared.registerUserDetailsFetchErrorEvent(
//         Get.currentRoute,
//         l.errorMessage,
//       );
//     }, (user) async {
//       await StorageService.box
//           .saveValue(Preferences.isIdentityCheckCompleted, true);
//
//       CustomTracker.shared.registerUserDetailsFetchEvent(
//         Get.currentRoute,
//       );
//       switch (user.onboardingState) {
//         case OnBoardingStatus.signed_up:
//           page = Routes.UPDATE_PHONE_NUMBER;
//           break;
//         case OnBoardingStatus.invited:
//           page = Routes.WELCOME_SCREEN;
//           break;
//         case OnBoardingStatus.secondary_email_verified:
//           page = Routes.SIGNUP;
//           break;
//         case OnBoardingStatus.email_verified:
//           page = Routes.UPDATE_PHONE_NUMBER;
//           break;
//         case OnBoardingStatus.phone_verified:
//         case OnBoardingStatus.full_name_set:
//         case OnBoardingStatus.identity_set:
//           page = Routes.UPDATE_FULL_NAME;
//           break;
//         case OnBoardingStatus.onboarded:
//           if ([Routes.LOGIN, Routes.SIGNUP, Routes.WELCOME_SCREEN]
//               .contains(fromRoute)) {
//             await StorageService.box.saveValue(Preferences.isOnboarded, true);
//             page = Routes.HOME;
//           } else {
//             page = Routes.ONBOARDING_SUCCESS;
//           }
//           break;
//         case OnBoardingStatus.not_invited:
//           if (Get.currentRoute.isNotEmpty) {
//             page = Routes.WAITLIST_SECRET_CODE;
//             break;
//           } else {
//             page = Routes.WELCOME_SCREEN;
//             break;
//           }
//         default:
//           page = Routes.WELCOME_SCREEN;
//           break;
//       }
//     });
//     return page;
//   }
//
//   static Future<void> goToOnBoardingPage(
//       {String? fromRoute, Map<String, dynamic>? arguments}) async {
//     String? route = await getOnBoardingPage(fromRoute: fromRoute);
//     if (route != null) {
//       Get.offAllNamed(
//         route,
//         arguments: route == arguments?[Preferences.appRoute] ? arguments : null,
//       );
//     }
//   }
// }
