import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../common/config/flavor_config.dart';
import '../../common/constants/preferences.dart';
import '../../common/service/storage_service.dart';
import 'api_endpoints.dart';

class TokenRepository {
  Dio refreshDio = Dio()
    ..options.connectTimeout = const Duration(milliseconds: 20000)
    ..options.receiveTimeout = const Duration(milliseconds: 20000)
    ..options.followRedirects = false;

  TokenRepository() {
    if (kDebugMode) {
      refreshDio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
        ),
      );
    }
  }

  Future<String?> loadAccessToken() async {
    final String? refreshToken = await StorageService.box.getRefreshToken();
    if (refreshToken == null || refreshToken == "") {
      return null;
    }

    refreshDio.options.headers["Refresh-Token"] = refreshToken;

    try {
      final refreshResponse = await refreshDio.post(
        "${FlavorConfig.instance?.values.baseUrl}${ApiEndPoints.refreshTokenApi}",
      );

      String? accessTokenFromResponse =
          refreshResponse.data[Preferences.result][Preferences.accessToken];

      if (accessTokenFromResponse != null && accessTokenFromResponse != "") {
        await StorageService.box.storeToken(
          accessToken: refreshResponse.data[Preferences.result]
              [Preferences.accessToken],
          refreshToken: refreshResponse.data[Preferences.result]
              [Preferences.refreshToken],
        );
      }
      return accessTokenFromResponse;
    } catch (e) {
      // await Utils.logout();
    }
    return null;
  }
}
