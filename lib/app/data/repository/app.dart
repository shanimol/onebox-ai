import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../common/di/injectable.dart';
import '../../common/util/utils.dart';
import '../api/api_client.dart';
import '../api/api_provider.dart';
import '../models/configuration.dart';

class NetworkService extends GetxService {
  static NetworkService networkService = Get.find();
  ApiClient api = ApiClient(apiProvider());
}

abstract class IAppRepository {
  Future<Either<dynamic, Configuration>> getData();
}

@Injectable(as: IAppRepository, env: [ServiceEnv.app])
class AppRepository extends IAppRepository {
  final ApiClient api = NetworkService.networkService.api;

  @override
  Future<Either<dynamic, Configuration>> getData() async {
    dynamic response;
    try {
      response = await api.get(uri: 'https://get.geojs.io/v1/ip/country.json');
      final result =
          await compute(Utils.extractClassFromJson<Configuration>, response);
      return Right(result);
    } catch (exception) {
      return Left(exception);
    }
  }
}
