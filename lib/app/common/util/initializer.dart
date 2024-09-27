import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repository/app.dart';
import '../config/flavor_config.dart';
import '../di/injectable.dart';
import '../service/storage_service.dart';

class Initializer {
  static final Initializer instance = Initializer._internal();

  factory Initializer() => instance;

  Initializer._internal();

  void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      FlutterError.onError = (details) {
        // FlutterError.dumpErrorToConsole(details);
        //
        // printInfo(info: details.stack.toString());
        // Print the error message
        print('Error: ${details.exceptionAsString()}');

        // Print the stack trace, which includes line numbers and file names
        print('Stack trace: ${details.stack}');

        // Optionally, dump the error to the console
        FlutterError.dumpErrorToConsole(details);

        // Log the error using a custom logging function
        printInfo(info: details.stack.toString());
      };

      ///Get it dependency injection
      await configureInjection();

      WidgetsFlutterBinding.ensureInitialized();

      await _initServices();
      runApp();
    }, (error, stack) async {
      printInfo(info: 'runZonedGuarded: ${stack.toString()}');
    });
  }

  Future<void> _initServices() async {
    try {
      _initScreenPreference();
      await _initStorage();
      await _initAppConfig();
      //_initDotEnv();
      _initApis();

      //  _setDisplayToHighRefreshRate();
    } catch (err) {
      rethrow;
    }
  }

  // Future<dynamic> getPlatformConfigData() async {
  //   const platform = MethodChannel("club_keystore_channel");
  //
  //   try {
  //     // Call the native method to get the SDK keys and secrets from BuildConfig
  //     final configData = await platform.invokeMethod('getBuildConfigData');
  //     return configData;
  //   } on PlatformException catch (_) {
  //     // Handle platform exception
  //     return "";
  //   }
  // }
  //
  // Future<void> configureFirebase() async {
  //   try {
  //     final remoteConfig = FirebaseRemoteConfig.instance;
  //
  //     /// fetch() will be invoked only time is passed minimumFetchInterval(set to 5 min for stg, dev and 1 hr for prd)
  //     final int minimumFetchInterval = int.parse(StorageService.box
  //             .getValue(Preferences.remoteConfigFetchIntervalMinutes) ??
  //         FlavorConfig.instance?.values.remoteConfigFetchInterval ??
  //         "5");
  //
  //     ///This is an effective strategy is to load new configuration values to activate on the app's next startup
  //     ///With this strategy, user wait time is greatly minimized
  //     ///keep all the call to firebase as asynchronous
  //     await remoteConfig.setConfigSettings(RemoteConfigSettings(
  //       fetchTimeout: const Duration(minutes: 1),
  //       minimumFetchInterval: Duration(minutes: minimumFetchInterval),
  //     ));
  //
  //     /// Fetch remote config values
  //     final fetchFuture = remoteConfig.fetchAndActivate();
  //     final timeoutFuture = Future.delayed(
  //         Duration(seconds: Configurations.remoteConfigTimeout), () => false);
  //
  //     /// Wait for either fetch to complete or timeout to exceed
  //     bool updated = await Future.any([fetchFuture, timeoutFuture]);
  //     if (!updated) {
  //       SentryUtils.logEvent(
  //           message: 'Remote config fetch failed Duration Exceeded 5s');
  //     }
  //   } catch (e) {
  //     SentryUtils.logEvent(message: e.toString());
  //   }
  // }

  // void _initDeepLinkService() {
  //   DeepLinkService.instance.init();
  // }
  //
  // void _initPushNotificationService() {
  //   Get.put<PushNotificationService>(
  //       PushNotificationService(CleverTapPlugin()));
  // }

  void _initApis() {
    Get.put<NetworkService>(NetworkService());
    // Get.put<NetworkWithApiInterfaceController>(
    //     NetworkWithApiInterfaceController());
  }

  Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put<StorageService>(StorageService());
  }

  // Future<void> _initFirebase() async {
  //   try {
  //     // In case of IOS, options are read from GoogleService-info.plist,
  //     // For android when using googleServices.json, it interferes with the already existing google-signin feature
  //     // Therefore for android, flavor based options are passed during initialization time
  //     await Firebase.initializeApp();
  //   } catch (e) {
  //     SentryUtils.logEvent(message: e.toString());
  //   }
  // }

  // Future<void> _setDisplayToHighRefreshRate() async {
  //   if (Platform.isAndroid) {
  //     try {
  //       await FlutterDisplayMode.setHighRefreshRate();
  //     } on PlatformException catch (e) {
  //     //  SentryUtils.logEvent(message: e.toString());
  //     }
  //   }
  // }

  void _initScreenPreference() {
    try {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      /// TODO: remove this when flutter stable is updated with fix to [https://github.com/flutter/flutter/issues/119711]
      TextMagnifier.adaptiveMagnifierConfiguration = TextMagnifierConfiguration(
          shouldDisplayHandlesInMagnifier: false,
          magnifierBuilder: (
            BuildContext context,
            MagnifierController controller,
            ValueNotifier<MagnifierInfo> magnifierInfo,
          ) {
            switch (defaultTargetPlatform) {
              case TargetPlatform.iOS:
                return null;
              case TargetPlatform.android:
                return TextMagnifier(
                  magnifierInfo: magnifierInfo,
                );
              case TargetPlatform.fuchsia:
              case TargetPlatform.linux:
              case TargetPlatform.macOS:
              case TargetPlatform.windows:
                return null;
            }
          });
    } catch (_) {}
  }

  Future<void> _initAppConfig() async {
    Map configData = {};

    FlavorConfig(
        flavor: Flavor.dev,
        values: FlavorValues(baseUrl: "https://api-insider.stg.infinyte.club"));
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String? message;

  const CustomErrorWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message ?? "dfs",
          style: Get.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
