// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
// import 'dart:ui' as ui;
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart' hide Config;
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:infinyte/app/common/analytics/tracker/custom_tracker.dart';
// import 'package:infinyte/app/common/constants/config.dart';
// import 'package:infinyte/app/common/constants/messages.dart';
// import 'package:infinyte/app/common/constants/preferences.dart';
// import 'package:infinyte/app/common/oauth/authenticator/authenticator.dart';
// import 'package:infinyte/app/common/service/configurations.dart';
// import 'package:infinyte/app/common/service/deeplink_service.dart';
// import 'package:infinyte/app/common/service/feature_flags.dart';
// import 'package:infinyte/app/common/service/navigation_handler.dart';
// import 'package:infinyte/app/common/service/storage_service.dart';
// import 'package:infinyte/app/common/util/sentry_utils.dart';
// import 'package:infinyte/app/common/util/string_utils.dart';
// import 'package:infinyte/app/common/util/translations_util.dart';
// import 'package:infinyte/app/data/models/class_factories.dart';
// import 'package:infinyte/app/data/models/currency/currency.dart';
// import 'package:infinyte/app/data/models/error/api_error.dart';
// import 'package:infinyte/app/data/models/user/committer.dart';
// import 'package:infinyte/app/routes/app_pages.dart';
// import 'package:infinyte/app/widgets/common/bottom_sheet_confirmation_dialog.dart';
// import 'package:infinyte/app/widgets/common/custom_inkwell_widget.dart';
// import 'package:infinyte/app/widgets/common/custom_text_button.dart';
// import 'package:infinyte/app/widgets/common/custom_toast.dart';
// import 'package:infinyte/app/widgets/common/horizontal_filled_button.dart';
// import 'package:infinyte/app/widgets/common/loading_indicator.dart';
// import 'package:intl/intl.dart';
// import 'package:intl_phone_field/phone_number.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:money2/money2.dart' as money;
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shorebird_code_push/shorebird_code_push.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import 'exports.dart';
//
import 'dart:io';

import '../../data/models/class_factories.dart';

class Utils {
  const Utils._();

//   static ClubScreenMode screenMode = ClubScreenMode.NORMAL;
//
//   static DateTime get getCurrentTime => DateTime.now().toUtc();
//
//   static bool get isCropEnabled =>
//       (StorageService.box.getValue(Preferences.isCropEnabled) as String?)
//           ?.parseBool() ??
//       true;
//
//   static void showDialog(
//     String? message, {
//     String title = Strings.error,
//     bool success = false,
//     VoidCallback? onTap,
//   }) =>
//       Get.defaultDialog(
//         backgroundColor: AppColors.gray10,
//         barrierDismissible: false,
//         onWillPop: () async {
//           Get.back();
//
//           onTap?.call();
//
//           return true;
//         },
//         title: success ? Strings.success : title,
//         content: Text(
//           message ?? Strings.somethingWentWrong,
//           textAlign: TextAlign.center,
//           maxLines: 6,
//           style: AppTextStyle.smallRegular12.copyWith(
//             color: AppColors.white,
//             fontSize: Dimens.fontSize16,
//           ),
//         ),
//         confirm: Align(
//           alignment: Alignment.centerRight,
//           child: CustomInkwellWidget.text(
//             onTap: () {
//               Get.back();
//
//               onTap?.call();
//             },
//             title: Strings.ok,
//             textStyle: AppTextStyle.buttonTextStyle.copyWith(
//               fontSize: Dimens.fontSize18,
//             ),
//           ),
//         ),
//       );
//
//   static void showIconDialog(
//     String title,
//     String message, {
//     Widget? imageWidget,
//     VoidCallback? onTap,
//   }) =>
//       Get.dialog(
//         AlertDialog(
//           title:
//               imageWidget ?? const Icon(Icons.done), //add your icon/image here
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: AppTextStyle.smallRegular12.copyWith(
//                   color: Colors.black,
//                   fontSize: Dimens.fontSize24,
//                 ),
//               ),
//               SizedBox(height: 10.w),
//               Text(message,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyle.regularStyle.copyWith(
//                     color: AppColors.mineShaft,
//                     fontSize: Dimens.fontSize16,
//                   )),
//               SizedBox(height: 20.w),
//               CustomTextButton(
//                 title: Strings.ok,
//                 onPressed: () {
//                   Get.back();
//
//                   onTap?.call();
//                 },
//               ),
//             ],
//           ),
//         ),
//         barrierDismissible: false,
//       );
//
//   static void timePicker(
//     Function(String time) onSelectTime, {
//     TimeOfDay? initialTime,
//   }) {
//     showTimePicker(
//       context: Get.overlayContext!,
//       initialTime: initialTime ??
//           TimeOfDay.fromDateTime(
//             DateTime.now(),
//           ),
//     ).then((v) {
//       if (v != null) {
//         final now = DateTime.now();
//         final dateTime = DateTime(
//           now.year,
//           now.month,
//           now.day,
//           v.hour,
//           v.minute,
//         );
//
//         onSelectTime(dateTime.formattedDate(dateFormat: 'hh:mm aa'));
//       }
//     });
//   }
//
//   static void loadingDialog() {
//     Utils.closeDialog();
//
//     Get.dialog(LoadingIndicator());
//   }
//
//   static void closeDialog() {
//     if (Get.isDialogOpen!) {
//       Get.back();
//     }
//   }
//
//   static void closeSnackbar() {
//     if (Get.isSnackbarOpen) {
//       Get.back();
//     }
//   }
//
//   static void showSnackbar(String? message) {
//     closeSnackbar();
//
//     Get.rawSnackbar(message: message);
//   }
//
//   static void closeKeyboard() {
//     final currentFocus = Get.focusScope!;
//     if (!currentFocus.hasPrimaryFocus) {
//       currentFocus.unfocus();
//     }
//   }
//
//   static void goBackToScreen(String routeName) {
//     Get.until(
//       (route) => route.settings.name == routeName,
//     );
//   }
//
  static T extractClassFromJson<T extends JsonParsableClass>(dynamic response) {
    return ClassFactories.classFactoriesMap[T]!(response);
  }

//
//   static List<T> extractClassListFromJson<T extends JsonParsableClass>(
//       dynamic response) {
//     return List<T>.from(response.map(
//       (json) => ClassFactories.classFactoriesMap[T]!(json),
//     ));
//   }
//
//   static Future<void> downloadImagesToCache(
//       {required List<String> listOfImageUrls}) async {
//     for (final item in listOfImageUrls) {
//       FileInfo? fileInfo = await DefaultCacheManager().getFileFromCache(item);
//       bool fileExists = false;
//
//       /// if file exists then fileExists is set to true , else false
//       if (fileInfo != null) {
//         fileExists = await fileInfo.file.exists();
//       }
//
//       /// if the file does not exists , then we download it in the cache
//       if (!fileExists) {
//         try {
//           await DefaultCacheManager().downloadFile(item);
//         } catch (_) {}
//       }
//     }
//   }
//
//   static String url = StorageService.box.getWaitlistFormUrl();
//
//   static showWaitlistScreen(String? email, String? verificationToken) {
//     CustomTracker.shared.showWaitListPopup('WAITLIST_SCREEN', email);
//     if (Get.currentRoute.isNotEmpty) {
//       NavigationHandler.navigateToWaitlistView();
//       // Get.bottomSheet(
//       //     WaitlistSecretCodeView(
//       //       email: email,
//       //       verificationToken: verificationToken,
//       //     ),
//       //     enableDrag: false,
//       //     isDismissible: false,
//       //     barrierColor: AppColors.lightCharcoal,
//       //     ignoreSafeArea: false,
//       //     isScrollControlled: true);
//     }
//   }
//
//   static void onClickUrl(String? email) {
//     CustomTracker.shared.waitlistCtaClicked('WAITLIST_SCREEN', email);
//     launchUrl(
//       Uri.parse(url),
//       mode: LaunchMode.platformDefault,
//     );
//   }
//
  static Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (e) {
      return false;
    }
  }
//
//   /// Will later transition to custom Exception handling class
//   /// that maps {errorCode,errorMessage} from backend to errorMessage
//   /// to be shown in toast. Then `errorMessageToBeShown` would no longer
//   /// be needed
//   static Future<ApiError> handleAPIException(
//       Object exception, String errorMessageToBeShown, dynamic response) async {
//     try {
//       /// To handle network error
//       if (response != null) {
//         return await compute(
//             Utils.extractClassFromJson<RestApiError>, response);
//       }
//       throw exception;
//     } on dio.DioException catch (dioException) {
//       if (dioException.response != null) {
//         try {
//           RestApiError error = await compute(
//               Utils.extractClassFromJson<RestApiError>,
//               dioException.response?.data["error"]);
//           if (error.errorType == ErrorType.apiError) {
//             error.errorMessage = errorMessageToBeShown;
//           }
//           return error;
//         } catch (e) {
//           return RestApiError(errorMessage: errorMessageToBeShown);
//         }
//       }
//
//       ///This line executes when the internet connection lost after the api call
//       return RestApiError(
//           errorMessage: Messages.NETWORK_CONNECTION_ERROR,
//           errorType: ErrorType.networkError);
//     } catch (_) {
//       return RestApiError(
//           errorMessage: Messages.NETWORK_CONNECTION_ERROR,
//           errorType: ErrorType.networkError);
//     }
//   }
//
//   static Size componentSize(
//       double padding, double margin, int noOfComponents, Size size) {
//     // sizefinal renderBox = context.findRenderObject() as RenderBox;
//     // renderBox.size.width
//     final totalMargin = ((noOfComponents + 4) * margin) + padding;
//     final width = (Get.width - totalMargin) / noOfComponents;
//     final height = (1 / size.aspectRatio) * width;
//     return Size(width, height);
//   }
//
//   static money.Currency currency() =>
//       money.Currencies().find(CountryCurrencyCodes.INR.name) ??
//       money.CommonCurrencies().inr;
//
//   static Future<FileInfo?> downloadAndFetchFile(
//       {required String fileUrl}) async {
//     FileInfo? fileInfo = await DefaultCacheManager().getFileFromCache(fileUrl);
//
//     /// if file exists then fileExists is set to true , else false
//     if (fileInfo != null) {
//       return fileInfo;
//     } else {
//       /// if the file does not exists , then we download it in the cache
//       try {
//         fileInfo = await DefaultCacheManager().downloadFile(fileUrl);
//         return fileInfo;
//       } catch (e) {
//         SentryUtils.logEvent(message: e.toString());
//       }
//     }
//
//     return null;
//   }
//
//   static Future<bool> getStoragePermission() async {
//     final permissionStatus = await Permission.storage.request();
//     if (permissionStatus.isGranted) {
//       return true;
//     } else if (permissionStatus.isPermanentlyDenied) {
//       await openAppSettings();
//     } else if (permissionStatus.isDenied) {
//       await Permission.storage.request();
//     }
//     return false;
//   }
//
//   static FontWeight getCorrespondingFontWeight(AppFontWeight appFontWeight) {
//     switch (appFontWeight) {
//       case AppFontWeight.light:
//         return FontWeight.w300;
//       case AppFontWeight.regular:
//         return FontWeight.w400;
//       case AppFontWeight.medium:
//         return FontWeight.w500;
//       case AppFontWeight.bold:
//         return FontWeight.w700;
//     }
//   }
//
//   static BigInt convertCurrency({
//     required money.Money amount,
//     required ClubCurrency baseCurrency,
//     required ClubCurrency convertCurrency,
//   }) {
//     return BigInt.from(
//       amount.minorUnits.toDouble() * convertCurrency.rate / baseCurrency.rate,
//     );
//   }
//
//   static bool tokenHasExpired(String? token) {
//     if (token == null) return true;
//     try {
//       return JwtDecoder.isExpired(token);
//     } catch (e) {
//       return false;
//     }
//   }
//
//   static Future<void> launchWhatsapp({
//     String? phoneNumber,
//     String? textMessage,
//   }) async {
//     String? whatsappNumber = phoneNumber;
//
//     if (phoneNumber?.isEmpty ?? true) {
//       whatsappNumber =
//           StorageService.box.getValue(Preferences.reachOutWhatsapp);
//     }
//
//     try {
//       Uri url = Uri();
//       if (Platform.isAndroid) {
//         url = Uri.parse(
//             "${Config.androidWhatsappUrl}$whatsappNumber&text=${textMessage != null ? Uri.encodeComponent(textMessage) : " "}");
//       } else if (Platform.isIOS) {
//         url = Uri.parse(
//             "${Config.iosWhatsappUrl}$whatsappNumber?text=${textMessage != null ? Uri.encodeComponent(textMessage) : " "}");
//       }
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       SentryUtils.logEvent(message: e.toString());
//       CustomToast.showInfoToast(Strings.whatsappFailed.translate());
//     }
//   }
//
//   static Future<void> launchWhatsappOrShareSheet({
//     String? phoneNumber,
//     String? textMessage,
//   }) async {
//     String? whatsappNumber = phoneNumber;
//
//     if (phoneNumber?.isEmpty ?? true) {
//       whatsappNumber =
//           StorageService.box.getValue(Preferences.reachOutWhatsapp);
//     }
//
//     try {
//       Uri url = Uri();
//       if (Platform.isAndroid) {
//         url = Uri.parse(
//             "${Config.androidWhatsappUrl}$whatsappNumber&text=${textMessage != null ? Uri.encodeComponent(textMessage) : " "}");
//       } else if (Platform.isIOS) {
//         url = Uri.parse(
//             "${Config.iosWhatsappUrl}$whatsappNumber?text=${textMessage != null ? Uri.encodeComponent(textMessage) : " "}");
//       }
//
//       if (FeatureFlags.isWhatsappForMultiplayerInvite) {
//         await launchUrl(url, mode: LaunchMode.externalApplication);
//       } else {
//         Share.share(textMessage ?? '');
//       }
//     } catch (e) {
//       SentryUtils.logEvent(message: e.toString());
//       CustomToast.showInfoToast(Strings.whatsappFailed.translate());
//     }
//   }
//
//   static Future<void> launchLinkedin() async {
//     try {
//       String linkedinUrl = "linkedin://profile";
//       Uri url = Uri();
//       url = Uri.parse(linkedinUrl);
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       CustomToast.showErrorToast(Strings.linkedinError.translate());
//       SentryUtils.logEvent(message: e.toString());
//     }
//   }
//
//   // void onTapButton() {
//   //   print('url viewed');
//   //   launchUrl(Uri.parse(url!), mode: LaunchMode.inAppWebView);
//   // }
//
//   static Future<void> logout({
//     String? landingPage,
//   }) async {
//     try {
//       bool hasAuthToken = await StorageService.box.hasAuthToken();
//       if (hasAuthToken) {
//         CustomTracker.shared.registerLogoutEvent(
//           Get.currentRoute,
//         );
//         await Future.wait(
//           [
//             StorageService.box.clearStorage(),
//             logoutSSO(),
//             logoutFromNative(),
//           ],
//         );
//         CustomTracker.shared.logout();
//         DeepLinkService.instance.logout();
//         DefaultCacheManager().emptyCache();
//         await Future.wait(
//           [
//             StorageService.box.saveValue(Preferences.hasIntroScreenShown, true),
//             StorageService.box.saveValue(Preferences.isFirstTimeRun, false),
//           ],
//         );
//         SentryUtils.clearUserContext();
//         _navigateToScreenOnLogout(landingPage ?? Routes.WELCOME_SCREEN);
//       }
//       return;
//     } catch (e) {
//       SentryUtils.logEvent(message: "Logout failed: ${e.toString()}");
//       return;
//     }
//   }
//
//   static Future<void> _navigateToScreenOnLogout(String screen) async {
//     try {
//       if (Get.currentRoute != '' && Get.currentRoute != screen) {
//         await Get.offAllNamed(screen);
//       }
//     } catch (e) {
//       SentryUtils.logEvent(message: "Logout failed: ${e.toString()}");
//     }
//   }
//
//   static Future<void> logoutSSO() async {
//     await Authenticator.instance.signOutFromAllOAuthProviders();
//     // Map<String, dynamic> configurations = StorageService.box.getConfiguration();
//     // await StorageService.box.clearUserdefault();
//     // DeepLinkService.instance.clearData();
//     // await StorageService.box.saveValue(Preferences.hasIntroScreenShown, true);
//     // await StorageService.box.saveValue(Preferences.isFirstTimeRun, false);
//     // StorageService.box.storeConfiguration(configurations);
//   }
//
//   ///This is to clear the secret code from native side
//   static Future<void> logoutFromNative() async {
//     const platform = MethodChannel("club_keystore_channel");
//
//     try {
//       await platform.invokeMethod('userLogout') as String?;
//       return;
//     } on PlatformException catch (e) {
//       // Handle platform exception
//       SentryUtils.logEvent(message: e.toString());
//       return;
//     }
//   }
//
//   static Future<bool> deviceSecurityCheck() async {
//     const platform = MethodChannel("club_keystore_channel");
//     try {
//       final bool isSecure = await platform.invokeMethod('deviceSecurityStatus');
//       return isSecure;
//     } catch (e) {
//       print(e.toString());
//       return false;
//     }
//   }
//
//   static CompressFormat getCompressFormat(String extension) {
//     switch (extension) {
//       case 'jpeg':
//         return CompressFormat.jpeg;
//       case 'png':
//         return CompressFormat.png;
//       case 'heic':
//         return CompressFormat.heic;
//       default:
//         return CompressFormat.jpeg;
//     }
//   }
//
//   static Future<PlatformFile> compressFile(PlatformFile platformFile) async {
//     PlatformFile result = platformFile;
//     String? fileCompressionQuality =
//         StorageService.box.getValue(Preferences.fileCompressionQuality);
//     try {
//       var compressionOutput = await FlutterImageCompress.compressAndGetFile(
//           platformFile.path ?? '',
//           "${(await getTemporaryDirectory()).path}/${platformFile.name}",
//           quality: fileCompressionQuality == null
//               ? 50
//               : int.parse(fileCompressionQuality),
//           format: getCompressFormat(platformFile.extension ?? ''));
//       if (compressionOutput != null) {
//         result = PlatformFile(
//           path: compressionOutput.path,
//           name: compressionOutput.path,
//           size: await compressionOutput.length(),
//         );
//       }
//     } catch (E) {
//       if (kDebugMode) {
//         print("object $E");
//       }
//     }
//     return result;
//   }
//
//   static String bytesToMegabytes(String bytesString) {
//     try {
//       int bytes = int.parse(bytesString);
//       double megabytes = bytes / (1024 * 1024);
//       return megabytes.toStringAsFixed(0);
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static Future<PlatformFile?> checkAndCompressFile(
//     PlatformFile file, {
//     bool shouldRestrictOnSize = true,
//   }) async {
//     if (shouldRestrictOnSize) {
//       String? maxUploadSize =
//           StorageService.box.getValue(Preferences.fileUploadMaxSize);
//       if (maxUploadSize != null) {
//         if (file.size > int.parse(maxUploadSize)) {
//           CustomToast.showInfoToast(Strings.fileSizeText.translate(
//             args: [
//               bytesToMegabytes(maxUploadSize),
//             ],
//           ));
//
//           return null;
//         }
//       }
//     }
//     if (file.size > 500000 && FeatureFlags.fileCompressionEnabled) {
//       file = await compressFile(
//         file,
//       );
//       return file;
//     } else {
//       return file;
//     }
//   }
//
//   static Future<PlatformFile?> pickImage(
//       {ImageSource source = ImageSource.gallery}) async {
//     final imagePicker = ImagePicker();
//     try {
//       var result = await imagePicker.pickImage(
//         source: source,
//         requestFullMetadata: false,
//       );
//
//       if (result != null) {
//         PlatformFile selectedFile = PlatformFile(
//           name: result.name,
//           size: await result.length(),
//           bytes: await result.readAsBytes(),
//           path: result.path,
//         );
//         return selectedFile;
//       }
//     } catch (e) {
//       SentryUtils.logEvent(message: "Failed to pick image", params: {
//         Preferences.error: e.toString(),
//       });
//       if (e is PlatformException) {
//         String? errorMessage;
//         if (source == ImageSource.gallery) {
//           if (await Permission.photos.status.isDenied) {
//             errorMessage = Messages.STORAGE_PERMISSION_DENIED;
//           }
//         } else {
//           if (await Permission.camera.status.isDenied) {
//             errorMessage = Messages.CAMERA_PERMISSION_DENIED;
//           }
//         }
//         if (errorMessage != null) {
//           if (e.code == "invalid_image") {
//             CustomToast.showErrorToast(
//                 "The selected image format is not supported.");
//           } else {
//             CustomToast.showErrorToast(errorMessage);
//           }
//           // Future.delayed(Duration(milliseconds: 500), () {
//           // openAppSettings();
//           // });
//         }
//       }
//       return null;
//     }
//     return null;
//   }
//
//   static Future<PlatformFile?> imageCrop(PlatformFile? selectedImage) async {
//     ImageCropper imageCropper = ImageCropper();
//     try {
//       CroppedFile? croppedFile = await imageCropper.cropImage(
//         sourcePath: selectedImage?.path ?? '',
//         aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
//         aspectRatioPresets: [
//           CropAspectRatioPreset.square,
//         ],
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: AppColors.black,
//             toolbarWidgetColor: AppColors.white,
//             initAspectRatio: CropAspectRatioPreset.square,
//             lockAspectRatio: true,
//             activeControlsWidgetColor: AppColors.black,
//           ),
//           IOSUiSettings(title: 'Cropper', aspectRatioLockEnabled: true)
//         ],
//       );
//       File fileCropped = File(croppedFile?.path ?? '');
//       PlatformFile fileToCompress = PlatformFile(
//           name: fileCropped.path.split('/').last,
//           size: await fileCropped.length(),
//           path: fileCropped.path);
//       return fileToCompress;
//     } catch (e) {
//       SentryUtils.logEvent(message: e.toString());
//       return null;
//     }
//   }
//
//   static Future<PlatformFile?> pickProfileImage() async {
//     PlatformFile? selectedFile = await pickImage();
//
//     if (selectedFile != null) {
//       PlatformFile? croppedFile =
//           isCropEnabled ? await imageCrop(selectedFile) : selectedFile;
//
//       if (croppedFile != null) {
//         PlatformFile? processedFile = await checkAndCompressFile(croppedFile);
//         return processedFile;
//       }
//     }
//
//     return null;
//   }
//
//   static Future<PlatformFile?> pickAndCompressImage() async {
//     PlatformFile? selectedFile = await pickImage();
//
//     // if (selectedFile != null) {
//     //   PlatformFile? processedFile =
//     //       await checkAndCompressFile(selectedFile, shouldRestrictOnSize: false);
//     //   return processedFile;
//     // }
//     return selectedFile;
//   }
//
//   static Future<List<PlatformFile>?> pickImagesAndDocuments({
//     bool allowMultiple = false,
//   }) async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowMultiple: allowMultiple,
//         allowedExtensions: Config.allowedExtensions,
//       );
//       if (result == null || result.files.isEmpty) {
//         return null;
//       } else {
//         bool isValidExtension = result.files.every(
//           (element) => Config.allowedExtensions.contains(
//             element.extension?.toLowerCase(),
//           ),
//         );
//         if (!isValidExtension) {
//           CustomToast.showInfoToast('Invalid file format');
//           return null;
//         } else if (result.files.every((element) {
//           String? maxUploadSize =
//               StorageService.box.getValue(Preferences.fileUploadMaxSize);
//           if (maxUploadSize == null) {
//             return false;
//           }
//           return element.size > int.parse(maxUploadSize);
//         })) {
//           String maxUploadSize =
//               StorageService.box.getValue(Preferences.fileUploadMaxSize);
//           CustomToast.showInfoToast(Strings.fileSizeText.translate(
//             args: [
//               bytesToMegabytes(maxUploadSize),
//             ],
//           ));
//           return null;
//         } else {
//           List<PlatformFile> fileList = [];
//           for (var element in result.files) {
//             //min threshold for compression 500kb
//             if (element.extension?.toLowerCase() != 'pdf' &&
//                 element.size > 500000 &&
//                 FeatureFlags.fileCompressionEnabled) {
//               fileList.add(await compressFile(element));
//             } else {
//               fileList.add(element);
//             }
//           }
//           return fileList;
//         }
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         if (await Permission.storage.isDenied) {
//           CustomToast.showErrorToast(Messages.STORAGE_PERMISSION_DENIED);
//           Future.delayed(Duration(milliseconds: 500), () {
//             openAppSettings();
//           });
//         }
//       }
//       return null;
//     }
//   }
//
//   static Future<PlatformFile?> pickDocument() async {
//     List<String> allowedExtensions = [
//       "pdf",
//       "jpg",
//       "jpeg",
//       "png",
//       "heic",
//       "heif",
//       "webp",
//       "bmp",
//       "tiff",
//       "psd",
//       "svg",
//       "raw"
//     ];
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: allowedExtensions,
//       );
//       if (result == null || result.files.isEmpty) {
//         return null;
//       } else {
//         bool isValidExtension = result.files.every((element) =>
//             allowedExtensions.contains(element.extension?.toLowerCase()));
//         if (!isValidExtension) {
//           CustomToast.showInfoToast('Invalid file format');
//           return null;
//         } else if (result.files.every((element) {
//           String? maxUploadSize =
//               StorageService.box.getValue(Preferences.fileUploadMaxSize);
//           if (maxUploadSize == null) {
//             return false;
//           }
//           return element.size > int.parse(maxUploadSize);
//         })) {
//           String maxUploadSize =
//               StorageService.box.getValue(Preferences.fileUploadMaxSize);
//           CustomToast.showInfoToast(Strings.fileSizeText.translate(
//             args: [
//               bytesToMegabytes(maxUploadSize),
//             ],
//           ));
//           return null;
//         } else {
//           PlatformFile? file;
//           for (var element in result.files) {
//             //min threshold for compression 500kb
//             if (element.extension?.toLowerCase() != 'pdf' &&
//                 element.size > 500000 &&
//                 FeatureFlags.fileCompressionEnabled) {
//               file = await compressFile(element);
//             } else {
//               file = element;
//             }
//           }
//           return file;
//         }
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         if (await Permission.storage.isDenied) {
//           CustomToast.showErrorToast(Messages.STORAGE_PERMISSION_DENIED);
//           Future.delayed(Duration(milliseconds: 500), () {
//             openAppSettings();
//           });
//         }
//       }
//       return null;
//     }
//   }
//
//   static Map<String, String?> getNavigateToFromDeeplinkString(
//       String urlString) {
//     try {
//       // Parse the URL string
//       Uri uri = Uri.parse(urlString);
//       return uri.queryParameters;
//     } catch (e) {
//       SentryUtils.logEvent(
//           message: "Unable to parse deeplink url",
//           params: {"error": e.toString()});
//       return {};
//     }
//   }
//
//   static bool hasUserCommitted(List<Committer>? committers) {
//     var isCommitment = committers?.where((element) =>
//         element.userData?.id == StorageService.box.getUserDetails()?.id);
//     return (isCommitment?.isEmpty ?? true) ? false : true;
//   }
//
//   static Future<Map<String, dynamic>> getDeviceInfo() async {
//     Map<String, dynamic> info = {};
//     try {
//       if (Platform.isAndroid) {
//         var androidInfo = await DeviceInfoPlugin().androidInfo;
//         info['version'] = androidInfo.version.release;
//         info['sdkInt'] = androidInfo.version.sdkInt;
//         info['manufacturer'] = androidInfo.manufacturer;
//         info['model'] = androidInfo.model;
//         info['os'] = "Android";
//       } else if (Platform.isIOS) {
//         var iosInfo = await DeviceInfoPlugin().iosInfo;
//         info['version'] = iosInfo.systemVersion;
//         info['model'] = iosInfo.model;
//         info['name'] = iosInfo.name;
//         info['os'] = "iOS";
//         // iOS 13.1, iPhone 11 Pro Max iPhone
//       }
//
//       StorageService.box.saveValue(Preferences.devicdInfo, info);
//
//       return info;
//     } catch (e) {
//       return info;
//     }
//   }
//
//   static Future<Map<String, dynamic>> getAppInfo() async {
//     Map<String, dynamic> info = {};
//     try {
//       PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       info['packageName'] = packageInfo.packageName;
//       info['version'] = packageInfo.version;
//       info['buildNumber'] = packageInfo.buildNumber;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return info;
//   }
//
//   static Future<String?> getVersion() async {
//     try {
//       PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       return packageInfo.version;
//     } catch (e) {
//       return "";
//     }
//   }
//
//   static Map<String, dynamic> urlEncode(Map<String, dynamic> data) {
//     try {
//       Map<String, String> encodedData = {};
//       data.forEach((key, value) {
//         encodedData[key] = Uri.encodeComponent(value.toString());
//       });
//
//       return encodedData;
//     } catch (e) {
//       return {};
//     }
//   }
//
//   static Future<T?> showCupertinoBottomSheet<T>(
//       {required BuildContext context,
//       required Widget child,
//       bool? useRootNavigator,
//       bool? isDismissible,
//       bool? enableDrag}) {
//     return CupertinoScaffold.showCupertinoModalBottomSheet(
//       barrierColor: Colors.black.withOpacity(0.7),
//       context: context,
//       builder: (context) => child,
//       useRootNavigator: useRootNavigator ?? false,
//       isDismissible: isDismissible,
//       enableDrag: enableDrag ?? true,
//     );
//   }
//
//   static Uint8List? fileToUint8List(File? file) {
//     if (file == null) return null;
//
//     List<int> bytes = file.readAsBytesSync();
//     return Uint8List.fromList(bytes);
//   }
//
//   static Future<void> cacheLocalImage(String filePath, String key) async {
//     DefaultCacheManager cacheManager = DefaultCacheManager();
//
//     await cacheManager.removeFile(key);
//
//     File fileInfo = await cacheManager.putFile(
//         "", fileToUint8List(File(filePath))!,
//         key: key, fileExtension: "jpg");
//     print(fileInfo.path);
//   }
//
//   static bool isTokenExpired(String token) {
//     try {
//       List<String> parts = token.split('.');
//       if (parts.length != 3) {
//         return false;
//         //throw Exception('Invalid token format');
//       }
//
//       String payload = base64Url.decode(parts[1]).toString();
//       Map<String, dynamic> payloadMap = json.decode(payload);
//
//       if (payloadMap.containsKey('exp')) {
//         int expirationTimeInSeconds = payloadMap['exp'];
//         DateTime expirationDateTime =
//             DateTime.fromMillisecondsSinceEpoch(expirationTimeInSeconds * 1000);
//
//         return DateTime.now().isAfter(expirationDateTime);
//       }
//
//       return false;
//     } catch (e) {
//       return false;
//     } // If 'exp' claim is not present, token is considered not expired
//   }
//
//   static String? extractCodeFromUrl(String? url) {
//     try {
//       Uri uri = Uri.parse(url ?? "");
//       List<String> segments = uri.pathSegments;
//       if (segments.isNotEmpty && segments.last != "null") {
//         return segments.last;
//       } else {
//         return null; // If there are no path segments
//       }
//     } catch (e) {
//       return null;
//     }
//   }
//
//   static void showDatePicker(
//     BuildContext context, {
//     required DateTime initialDateTime,
//     required void Function(DateTime) onDateTimeChanged,
//     DateTime? minimumDate,
//     void Function()? onClickButton,
//     bool isRightArrowPresent = true,
//   }) {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (_) => Container(
//         height: 320.h,
//         color: AppColors.black90,
//         padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
//         child: SafeArea(
//           top: false,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 height: 200.h,
//                 child: CupertinoDatePicker(
//                   mode: CupertinoDatePickerMode.date,
//                   initialDateTime: initialDateTime,
//                   onDateTimeChanged: onDateTimeChanged,
//                   minimumDate: minimumDate,
//                   dateOrder: DatePickerDateOrder.dmy,
//                 ),
//               ),
//               HorizontalFilledButton(
//                 height: 50.h,
//                 onClickButton: onClickButton,
//                 buttonLabel: Strings.ok.translate(),
//                 isRightArrowPresent: isRightArrowPresent,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   static String getEsopChartColor(int index) {
//     List<String> colors = [
//       Strings.esopChartColor1.translate(),
//       Strings.esopChartColor2.translate(),
//       Strings.esopChartColor3.translate(),
//       Strings.esopChartColor4.translate(),
//       Strings.esopChartColor5.translate(),
//       Strings.esopChartColor6.translate(),
//     ];
//     index = Utils.nullSafeOperation(
//       index,
//       (colors.length - 1),
//       (a, b) => a % b,
//       0,
//     );
//     return colors[index];
//   }
//
//   static bool isSmallScreen() {
//     return 1.sh < 854;
//   }
//
//   ///iphone 11 -> 896
//   static bool isMediumScreen() {
//     return 1.sh < 844;
//   }
//
//   static bool isLargeScreen() {
//     return 1.sh < 932;
//   }
//
//   static double safeDivision(double? a, double? b, double otherwise) {
//     try {
//       if (a == null || b == null || b == 0) {
//         return otherwise;
//       }
//
//       return a / b;
//     } catch (e) {
//       return otherwise;
//     }
//   }
//
//   static T nullSafeOperation<T>(
//       T? a, T? b, T Function(T a, T b) operation, T otherwise) {
//     try {
//       if (a == null && b == null) {
//         return otherwise;
//       } else if (a == null) {
//         return b ?? otherwise;
//       } else if (b == null) {
//         return a;
//       } else {
//         return operation(a, b);
//       }
//     } catch (e) {
//       return otherwise;
//     }
//   }
//
//   static String calculateTimeDifference(String timestamp1, String timestamp2) {
//     try {
//       if (timestamp1.isEmpty || timestamp2.isEmpty) {
//         return 'Not found';
//       }
//       DateTime dateTime1 = DateTime.parse(timestamp1);
//       DateTime dateTime2 = DateTime.parse(timestamp2);
//       int difference = dateTime1.difference(dateTime2).inSeconds;
//       return difference.toString();
//     } catch (e) {
//       return 'Error';
//     }
//   }
//
//   static void launchWebview(String? url) {
//     try {
//       String encodedUrl = Uri.encodeFull(url ?? "");
//       launchUrl(
//         Uri.parse(encodedUrl),
//         mode: LaunchMode.platformDefault,
//       );
//     } catch (_) {}
//   }
//
//   static Future<T?> closeButtonWithOutBottomSheet<T>({
//     required Widget child,
//     bool? ignoreSafeArea,
//     bool isScrollControlled = false,
//   }) {
//     return Get.bottomSheet<T>(
//       Container(
//         decoration: BoxDecoration(
//             color: AppColors.transactionBg,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12.r),
//               topRight: Radius.circular(12.r),
//             )),
//         child: child,
//       ),
//       ignoreSafeArea: ignoreSafeArea,
//       isScrollControlled: isScrollControlled,
//     );
//   }
//
//   static Future<T?> closeButtonBottomSheet<T>({
//     required Widget child,
//     bool? ignoreSafeArea,
//     bool isScrollControlled = false,
//     bool isDismissible = true,
//     VoidCallback? onClose,
//     bool isShowCloseButton = true,
//   }) {
//     return Get.bottomSheet<T>(
//       Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (isShowCloseButton)
//             Container(
//               color: Colors.transparent,
//               padding: EdgeInsets.only(
//                 bottom: 8.h,
//                 right: 16.w,
//               ),
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                   onTap: () {
//                     HapticFeedback.mediumImpact();
//
//                     if (onClose != null) {
//                       onClose();
//                     } else {
//                       Get.back();
//                     }
//                   },
//                   child: SvgPicture.asset(
//                     AppImages.circleCloseButton,
//                     width: 32.h,
//                     height: 32.h,
//                   ),
//                 ),
//               ),
//             ),
//           Container(
//             clipBehavior: Clip.hardEdge,
//             width: 1.sw,
//             decoration: BoxDecoration(
//                 color: AppColors.transactionBg,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12.r),
//                   topRight: Radius.circular(12.r),
//                 )),
//             child: child,
//           ),
//         ],
//       ),
//       ignoreSafeArea: ignoreSafeArea,
//       isScrollControlled: isScrollControlled,
//       isDismissible: isDismissible,
//     );
//   }
//
//   static Future<T?> customBottomSheet<T>({
//     required Widget child,
//     double? height,
//     double closeButtonSize = 32,
//     bool showCloseButton = false,
//     VoidCallback? onClose,
//     bool isFixed = false,
//     bool isDismissible = true,
//     bool enableDrag = true,
//     bool? ignoreSafeArea,
//   }) {
//     double closeButtonBottomPadding = 8.h;
//     double closeButtonEffectiveHeight =
//         closeButtonSize + closeButtonBottomPadding;
//     double? childEffectiveHeight = height != null
//         ? height - (showCloseButton ? closeButtonEffectiveHeight : 0)
//         : null;
//     double balanceHeight = height != null ? 1.sh - height : 0;
//
//     return Get.bottomSheet<T>(
//       Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (isFixed)
//             GestureDetector(
//               onTap: isDismissible ? Get.back : null,
//               child: Container(
//                 color: Colors.transparent,
//                 height: balanceHeight,
//               ),
//             ),
//           if (showCloseButton)
//             Row(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: isDismissible ? Get.back : null,
//                     child: Container(
//                       height: closeButtonEffectiveHeight,
//                       color: Colors.transparent,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     bottom: 8.h,
//                     right: 16.w,
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       HapticFeedback.mediumImpact();
//
//                       if (onClose != null) {
//                         onClose();
//                       } else {
//                         Get.back();
//                       }
//                     },
//                     child: SvgPicture.asset(
//                       AppImages.circleCloseButton,
//                       width: closeButtonSize,
//                       height: closeButtonSize,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           Container(
//             clipBehavior: Clip.hardEdge,
//             width: 1.sw,
//             height: childEffectiveHeight,
//             decoration: BoxDecoration(
//                 color: AppColors.transactionBg,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12.r),
//                   topRight: Radius.circular(12.r),
//                 )),
//             child: child,
//           ),
//         ],
//       ),
//       isScrollControlled: true,
//       isDismissible: isDismissible,
//       ignoreSafeArea: ignoreSafeArea,
//       enableDrag: enableDrag,
//     );
//   }
//
//   static double lerpDouble(double begin, double end, double t) {
//     return begin + (end - begin) * t;
//   }
//
//   // static double trimAnimationValue(
//   //   double max,
//   //   double min,
//   //   double t,
//   // ) {
//   //   if (t < min) {
//   //     return min;
//   //   }else if(t > max){
//   //     return max;
//   //   }else{
//   //     return t - ;
//   //   }
//   // }
//
//   static void showLogoutBottomSheet({bool isSoftLogout = true}) {
//     Get.bottomSheet(
//       BottomSheetConfirmationDialog(
//         subtitle: Strings.logoutConfirmation.translate(),
//         heading: Strings.areYouSure.translate(),
//         topButtonLabel: Strings.logoutBottomSheetButtonLabel.translate(),
//         bottomButtonLabel: Strings.goBack.translate(),
//         bottomButtonFunction: () {
//           CustomTracker.shared.logoutBackButtonClickedEvent(
//             Get.currentRoute,
//           );
//           Get.back();
//         },
//         topButtonFunction: () async {
//           await logout();
//         },
//         topTrailingIcon: SvgPicture.asset(
//           AppImages.powerIcon,
//           width: 20.w,
//           height: 20.w,
//           colorFilter: ColorFilter.mode(
//             AppColors.primaryNeon500,
//             BlendMode.srcIn,
//           ),
//         ),
//       ),
//       barrierColor: AppColors.lightCharcoal,
//     );
//     CustomTracker.shared.registerLogoutPageViewedEvent(
//       Get.currentRoute,
//     );
//   }
//
//   static String getLastEightCharacters(String input,
//       {bool? shouldShowId = false}) {
//     if ((input.length) <= 8) {
//       return (shouldShowId ?? false)
//           ? "ID: $input"
//           : input; // If the input string is 8 characters or less, return the input string as is
//     } else {
//       return (shouldShowId ?? false)
//           ? "ID: ${input.substring(input.length - 8)}"
//           : input.substring(input.length -
//               8); // Return the last 8 characters of the input string
//     }
//   }
//
//   static bool shouldShowViewAllUsers(int userCount) {
//     int minimumUserCount =
//         int.tryParse(Strings.minimumUserCountForViewAll.translate()) ?? 6;
//     return userCount > minimumUserCount;
//   }
//
//   static String getMonth(int month) {
//     switch (month) {
//       case 1:
//         return 'January';
//       case 2:
//         return 'February';
//       case 3:
//         return 'March';
//       case 4:
//         return 'April';
//       case 5:
//         return 'May';
//       case 6:
//         return 'June';
//       case 7:
//         return 'July';
//       case 8:
//         return 'August';
//       case 9:
//         return 'September';
//       case 10:
//         return 'October';
//       case 11:
//         return 'November';
//       case 12:
//         return 'December';
//       default:
//         return '';
//     }
//   }
//   //
//   static String getMonthNameSubString(int month) {
//     switch (month) {
//       case 1:
//         return 'JAN';
//       case 2:
//         return 'FEB';
//       case 3:
//         return 'MAR';
//       case 4:
//         return 'APR';
//       case 5:
//         return 'MAY';
//       case 6:
//         return 'JUN';
//       case 7:
//         return 'JUL';
//       case 8:
//         return 'AUG';
//       case 9:
//         return 'SEP';
//       case 10:
//         return 'OCT';
//       case 11:
//         return 'NOV';
//       case 12:
//         return 'DEC';
//       default:
//         return '';
//     }
//   }
//
//   static bool isCurrentUserWhitelisted(List<String>? whitelistEmailDomains) {
//     String currentUserPrimaryEmail =
//         StorageService.box.getUserDetails()?.email ?? '';
//     String currentUserSecondaryEmail =
//         StorageService.box.getUserDetails()?.secondaryEmail ?? '';
//
//     whitelistEmailDomains ??= [
//       Strings.keyvalueEmailDomain.translate(),
//       Strings.infinyteEmailDomain.translate(),
//     ];
//
//     return whitelistEmailDomains.contains(
//           StringUtils.getDomainFromEmail(currentUserPrimaryEmail),
//         ) ||
//         whitelistEmailDomains.contains(
//           StringUtils.getDomainFromEmail(currentUserSecondaryEmail),
//         );
//   }
//
//   static Future<bool> sharePdf(File pdfFile, String pdfTitle) async {
//     try {
//       final tempPdfFile = XFile(pdfFile.path, name: pdfTitle);
//       await Share.shareXFiles([tempPdfFile]);
//
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   static Future<int?> getShorebirdPatchNumber() async {
//     try {
//       return ShorebirdCodePush().currentPatchNumber();
//     } catch (e) {
//       return null;
//     }
//   }
//
//   static bool isDateFormatValid(int? year, int? month, int? day) {
//     DateFormat format = DateFormat("dd.MM.yyyy");
//
//     try {
//       format.parseStrict("$day.$month.$year");
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   static void switchToSplashScreenMode() {
//     // Switch to splash mode only if the current screen mode is not already splash mode.
//     // This function works only when the screen mode is changed using Utils' switch screen mode functions.
//     // It will not work if the screen mode is manually changed because it relies on the value of Utils.screenMode.
//     // That means, Manually changing the screen mode will not update Utils.screenMode, so this function won't execute in that case.
//
//     if (Utils.screenMode != ClubScreenMode.SPLASH) {
//       // setting the screen mode to edge to edge to match the native splash screen height
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//
//       // setting the system navigation bar color to the background of splash screen
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           systemNavigationBarColor: AppColors.blue,
//         ),
//       );
//
//       // setting the screen mode variable to splash mode
//       Utils.screenMode = ClubScreenMode.SPLASH;
//     }
//   }
//
//   static void switchToNormalMode() {
//     // Switch to normal mode only if the current screen mode is not already normal mode.
//     // This function works only when the screen mode is changed using Utils' switch screen mode functions.
//     // It will not work if the screen mode is manually changed because it relies on the value of Utils.screenMode.
//     // That means, Manually changing the screen mode will not update Utils.screenMode, so this function won't execute in that case.
//
//     if (Utils.screenMode != ClubScreenMode.NORMAL) {
//       // setting the screen mode to manual mode with status and navgation bars visible
//       SystemChrome.setEnabledSystemUIMode(
//         SystemUiMode.manual,
//         overlays: SystemUiOverlay.values,
//       );
//
//       // setting the system navigation bar color to black
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           systemNavigationBarColor: Colors.black,
//         ),
//       );
//
//       // setting the screen mode variable to normal mode
//       Utils.screenMode = ClubScreenMode.NORMAL;
//     }
//   }
//
//   static void launchTwitter(String? message) async {
//     try {
//       Uri url = Uri();
//       if (Platform.isIOS || Platform.isAndroid) {
//         url = Uri.parse(
//             "${Strings.launchTwitter.translate()}${message != null ? Uri.encodeComponent(message) : " "}");
//       } else {
//         url = Uri.parse(
//             "${Strings.launchTwitterWeb.translate()}${message != null ? Uri.encodeComponent(message) : " "}");
//       }
//
//       if (await canLaunchUrl(url)) {
//         await launchUrl(url, mode: LaunchMode.externalApplication);
//       } else {
//         // Twitter app is not installed, fall back to web URL
//         url = Uri.parse(
//             "${Strings.launchTwitterWeb.translate()}${message != null ? Uri.encodeComponent(message) : " "}");
//         if (await canLaunchUrl(url)) {
//           await launchUrl(url, mode: LaunchMode.externalApplication);
//         } else {
//           throw 'Could not launch $url';
//         }
//       }
//     } catch (e) {
//       CustomToast.showInfoToast(Strings.twitterOpenError.translate());
//       SentryUtils.logEvent(
//           message: "Navigate to twitter failed",
//           params: {"error": e.toString()});
//     }
//   }
//
//   static Color? colorFromString(String? stringColor) {
//     if (stringColor != null) {
//       int? intColor = int.tryParse(stringColor);
//       if (intColor != null) {
//         return Color(intColor);
//       }
//     }
//     return null;
//   }
//
//   static Future<String?> getAppVersion() async {
//     try {
//       PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       return packageInfo.version;
//     } catch (e) {
//       return null;
//     }
//   }
//
//   static PhoneNumber? getPhoneNumberFromString(String phoneNumber) {
//     PhoneNumber? phone;
//     try {
//       phone = PhoneNumber.fromCompleteNumber(completeNumber: phoneNumber);
//     } catch (e) {
//       SentryUtils.logEvent(message: e.toString());
//     }
//     return phone;
//   }
//
//   static bool? isBlacklistedApi(String? api) {
//     try {
//       if (api != null) {
//         List<String> blackListedApiList = Config.blackListedApiList;
//         return blackListedApiList.any(
//           (element) => element == api,
//         );
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
//
//
//
//   static double calculateSIP(
//       {required double monthlyInvestment,
//       required double annualInterestRate,
//       required int years}) {
//     double monthlyRate = annualInterestRate / 12 / 100; // Monthly interest rate
//     int totalMonths = years * 12; // Total number of months
//
//     double futureValue = monthlyInvestment *
//         ((pow((1 + monthlyRate), totalMonths) - 1) / monthlyRate) *
//         (1 + monthlyRate);
//
//     return futureValue;
//   }
}

enum ClubScreenMode {
  SPLASH,
  NORMAL,
}
