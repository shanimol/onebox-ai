import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network_logger/network_logger.dart';
import 'package:nexus/app/data/api/token_interceptor.dart';
import 'package:nexus/app/data/api/token_repository.dart';

import '../../common/service/storage_service.dart';

StorageService box = StorageService.box;

Dio apiProvider() {
  final dio = Dio();
  try {
    dio
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..options.followRedirects = false
      ..options.receiveDataWhenStatusError = true;

    dio.interceptors.addAll([
      ApiProviderTokenInterceptor(
        tokenRepository: TokenRepository(),
        dio: dio,
      ),
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
        ),
      // if (kDebugMode)
      //   PrettyDioLogger(
      //     requestBody: true,
      //     responseBody: true,
      //     requestHeader: true,
      //   ),
      DioNetworkLogger()
    ]);
  } catch (_) {}
  return dio;
}
