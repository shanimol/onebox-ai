import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../common/config/flavor_config.dart';
import '../../common/constants/messages.dart';
import '../../common/constants/preferences.dart';
import '../../common/service/storage_service.dart';
import '../../common/util/utils.dart';
import 'api_endpoints.dart';

enum ErrorType { apiError, networkError }

class ApiClient {
  // dio instance
  final Dio _api;

  // injecting dio instancez
  ApiClient(this._api);

  // Get API
  Future<dynamic> get({
    String? uri,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // if (!await Utils.checkInternetConnection()) {
      //   return {
      //     "message": Messages.NETWORK_CONNECTION_ERROR,
      //     "errorType": ErrorType.networkError,
      //   };
      // }
      final Response response = await _api.get(
        uri ?? FlavorConfig.instance?.values.baseUrl ?? '',
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadImage(
    List<File>? files,
    String operations,
    List<String> graphQlVariables, {
    String? uri,
  }) async {
    try {
      if (!await Utils.checkInternetConnection()) {
        return {
          Preferences.errors: [
            {
              "message": Messages.NETWORK_CONNECTION_ERROR,
              "errorType": ErrorType.networkError,
            }
          ]
        };
      } else {
        List<MultipartFile>? uploadFiles = files
            ?.map(
              (element) => MultipartFile.fromBytes(
                element.readAsBytesSync(),
              ),
            )
            .toList();
        final String finalUri = uri ??
            "${FlavorConfig.instance?.values.baseUrl}${ApiEndPoints.graphql}";
        final Response response = await _api.post(
          finalUri,
          options: Options(
            headers: {
              "Content-Type": "multipart/form-data",
              "Content-Disposition": "form-data",
            },
          ),
          data: FormData.fromMap(
            {
              "operations": operations,
              "map": jsonEncode(
                {
                  for (int i = 0; i < graphQlVariables.length; i++)
                    "$i": ["variables.${graphQlVariables[i]}"],
                },
              ),
              for (int i = 0; i < (uploadFiles?.length ?? 1); i++)
                "$i": uploadFiles?[i],
            },
          ),
        );
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  // Post API for graphql
  ///cache the data if the cache key is provided
  Future<dynamic> postGraphql(
      {String? uri,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      String? cacheKey}) async {
    try {
      if (!await Utils.checkInternetConnection()) {
        return {
          Preferences.errors: [
            {
              "message": Messages.NETWORK_CONNECTION_ERROR,
              "errorType": ErrorType.networkError,
            }
          ]
        };
      }

      final String finalUri = uri ??
          "${FlavorConfig.instance?.values.baseUrl}${ApiEndPoints.graphql}";
      final Response response = await _api.post(
        finalUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      ///if cache keys is present and the response is success, cache the data
      if (cacheKey != null && !response.data.containsKey(Preferences.errors)) {
        try {
          dynamic jsonString = jsonEncode(response.data);
          await StorageService.box.saveValue(cacheKey, jsonString);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Post API rest api
  Future<dynamic> post({
    String? uri,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // if (!await Utils.checkInternetConnection()) {
      //   return {
      //     Preferences.message: Messages.NETWORK_CONNECTION_ERROR,
      //     Preferences.errorType: ErrorType.networkError,
      //   };
      // }
      final String finalUri =
          uri ?? FlavorConfig.instance?.values.baseUrl ?? '';
      final Response response = await _api.post(
        finalUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Put API
  Future<dynamic> put({
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _api.put(
        FlavorConfig.instance?.values.baseUrl ?? '',
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Pass the download uri and file savePath, response will be
  /// either true/false/map containing no internet connection
  Future<dynamic> download({
    required String uri,
    required String savePath,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (!await Utils.checkInternetConnection()) {
        return {
          "message": Messages.NETWORK_CONNECTION_ERROR,
          "errorType": ErrorType.networkError,
        };
      }
      final Response _ = await Dio().download(
        uri,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> uploadFileToSignedURL(
    String uri,
    File pdfFile,
    String contentType,
    ProgressCallback? onSendProgress, {
    bool shouldIncludeMaxLengthHeader = true,
  }) async {
    try {
      if (!await Utils.checkInternetConnection()) {
        throw Exception(Messages.NETWORK_CONNECTION_ERROR);
      }
      final Response response = await _api.put(
        uri,
        options: Options(
          headers: {
            "Authorization": '',
            "Content-Type": contentType,
            if (shouldIncludeMaxLengthHeader)
              "x-goog-content-length-range": "0,5242880",
          },
        ),
        data: await pdfFile.readAsBytes(),
        onSendProgress: onSendProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(Messages.NETWORK_CONNECTION_ERROR);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadImageToSignedURL(
    String uri,
    File imageFile,
    String contentType,
    ProgressCallback? onSendProgress,
  ) async {
    try {
      if (!await Utils.checkInternetConnection()) {
        throw Exception(Messages.NETWORK_CONNECTION_ERROR);
      }
      final Response response = await _api.put(
        uri,
        options: Options(
          headers: {
            "Authorization": '',
            "Content-Type": contentType,
          },
        ),
        data: await imageFile.readAsBytes(),
        onSendProgress: onSendProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(Messages.NETWORK_CONNECTION_ERROR);
      }
    } catch (e) {
      rethrow;
    }
  }
}
