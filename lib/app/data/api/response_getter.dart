import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../common/constants/preferences.dart';
import '../../common/service/storage_service.dart';
import '../../common/util/utils.dart';
import '../models/class_factories.dart';
//

class ResponseGetter {
  ResponseGetter._();

  static dynamic getResponseFromGraphqlAPIResponse(
      {required Map apiResponse, required String apiName}) {
    return apiResponse[Preferences.data][apiName];
  }

  static Future<T?>
      getResponseFromCachedAPIResponseWithKey<T extends JsonParsableClass>({
    required String cacheKey,
    String? apiName,
  }) async {
    try {
      var cachedAPIResponseJSON = StorageService.box.getValue(cacheKey);
      final cachedAPIResponseData = await compute(
        Utils.extractClassFromJson<T>,
        getResponseFromGraphqlAPIResponse(
          apiResponse: jsonDecode(cachedAPIResponseJSON),
          apiName: apiName ?? cacheKey,
        ),
      );
      return cachedAPIResponseData;
    } catch (e) {
      return null;
    }
  }

  static Future<T>
      getResponseFromGraphqlAPIResponseWithKey<T extends JsonParsableClass>({
    required Map apiResponse,
    required String apiName,
  }) async {
    final apiResponseData = await compute(
      Utils.extractClassFromJson<T>,
      ResponseGetter.getResponseFromGraphqlAPIResponse(
        apiResponse: apiResponse,
        apiName: apiName,
      ),
    );
    return apiResponseData;
  }
}
