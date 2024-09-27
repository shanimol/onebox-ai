import 'package:dio/dio.dart';
import 'package:nexus/app/data/api/token_repository.dart';
import 'package:uuid/uuid.dart';

import '../../common/constants/messages.dart';
import '../../common/constants/preferences.dart';
import '../../common/service/storage_service.dart';

class ApiProviderTokenInterceptor extends QueuedInterceptor {
  final TokenRepository tokenRepository;
  final Dio dio;
  final Uuid uuid = const Uuid();

  Map<String, dynamic>? deviceInfo;
  Map<String, dynamic>? appInfo;

  ApiProviderTokenInterceptor({
    required this.tokenRepository,
    required this.dio,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await StorageService.box.getAuthToken();

    // if (token == null) {
    //   token = await tokenRepository.loadAccessToken();
    // }

    // options.headers.putIfAbsent(
    //   "Authorization",
    //   () => "Bearer $token",
    // );

    // options.headers.putIfAbsent(
    //   Preferences.requestId,
    //   () => uuid.v4(),
    // );
    //
    // deviceInfo ??= await Utils.getDeviceInfo();
    //
    // appInfo ??= await Utils.getAppInfo();

    ///To encode request header
    ///UTF-8
    // options.headers.addAll(Utils.urlEncode(deviceInfo ?? {}));
    // options.headers.addAll(Utils.urlEncode(appInfo ?? {}));

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    /// Function will check whether the response has error and log event if there is error.
    logGraphqlSentryError(response);

    return handler.next(response);
  }

  void logGraphqlSentryError(Response<dynamic> response) {
    // try {
    //   bool isBlacklistedApi = Utils.isBlacklistedApi(
    //           response.data?[Preferences.data]?.keys?.first) ??
    //       false;
    //   if (!isBlacklistedApi &&
    //       !FlavorConfig.isDevelopment() &&
    //       response.data is Map &&
    //       response.data.containsKey(Preferences.errors)) {
    //     SentryUtils.logEvent(
    //       message: response.data?[Preferences.errors]?[0]?[Preferences.message],
    //       params: {
    //         Preferences.baseUrl: response.requestOptions.baseUrl,
    //         Preferences.requestId:
    //             response.requestOptions.headers[Preferences.requestId],
    //         Preferences.userId: StorageService.box.getUserDetails()?.id ?? '',
    //         Preferences.response: response.data,
    //         Preferences.requestQuery: response.requestOptions.data,
    //       },
    //     );
    //   }
    // } catch (e) {
    //   SentryUtils.logEvent(message: e.toString());
    // }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logAPISentryError(err);
    if (err.response?.statusCode == 401) {
      try {
        String? token = await tokenRepository.loadAccessToken();

        if (token != null && token != "") {
          final retryRequest = await getRetryRequest(err, token);
          return handler.resolve(retryRequest);
        } else {
          throw Exception(
            Messages.TOKEN_INVALID_ERROR,
          );
        }
      } catch (e) {
        try {
          // await Utils.logout();
          return handler.next(
            DioException(
              requestOptions: err.response!.requestOptions,
              response: Response(
                data: {
                  Preferences.error: {
                    Preferences.message: Messages.AUTHENTICATION_FAILED,
                    Preferences.statusCode: err.response?.statusCode ??
                        Preferences.unAuthorizedCode,
                  },
                  Preferences.message: Messages.AUTHENTICATION_FAILED,
                  Preferences.statusCode:
                      err.response?.statusCode ?? Preferences.unAuthorizedCode,
                },
                requestOptions: err.response!.requestOptions,
              ),
            ),
          );
        } catch (e) {
          return handler.next(
            DioException(
              requestOptions: err.response!.requestOptions,
              response: Response(
                data: {
                  Preferences.error: {
                    Preferences.message: Messages.AUTHENTICATION_FAILED,
                    Preferences.statusCode: err.response?.statusCode ??
                        Preferences.unAuthorizedCode,
                  },
                  Preferences.message: Messages.AUTHENTICATION_FAILED,
                  Preferences.statusCode:
                      err.response?.statusCode ?? Preferences.unAuthorizedCode,
                },
                requestOptions: err.response!.requestOptions,
              ),
            ),
          );
        }
      }
    } else {
      return handler.next(err);
    }
  }

  void logAPISentryError(DioException dioError) {
    // try {
    //   if (FlavorConfig.isDevelopment() || FlavorConfig.isProduction()) {
    //     SentryUtils.logEvent(
    //       message: dioError.toString(),
    //       params: {
    //         Preferences.baseUrl: dioError.requestOptions.path,
    //         Preferences.requestId:
    //             dioError.requestOptions.headers[Preferences.requestId],
    //         Preferences.userId: StorageService.box.getUserDetails()?.id ?? '',
    //         Preferences.error: dioError.error.toString(),
    //         Preferences.response: dioError.response?.data,
    //         Preferences.requestQuery: dioError.requestOptions.data,
    //       },
    //     );
    //   }
    // } catch (e) {
    //   SentryUtils.logEvent(message: e.toString());
    // }
  }

  Future<Response> getRetryRequest(DioException dioError, String token) async {
    final RequestOptions cloneRequestOptions =
        dioError.response!.requestOptions;
    cloneRequestOptions.headers["Authorization"] = "Bearer $token";
    final cloneRequest = await dio.request(
      cloneRequestOptions.path,
      options: Options(
        method: cloneRequestOptions.method,
        headers: cloneRequestOptions.headers,
      ),
      data: cloneRequestOptions.data,
      queryParameters: cloneRequestOptions.queryParameters,
    );

    return cloneRequest;
  }
}
