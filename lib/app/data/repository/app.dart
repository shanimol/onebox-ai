// import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:nexus/app/data/models/calendar_task_id.dart';
import 'package:nexus/app/data/models/email.dart';
import 'package:nexus/app/data/models/meeting.dart';
import 'package:nexus/app/data/models/slack.dart';

import '../../common/di/injectable.dart';
import '../../common/util/utils.dart';
import '../api/api_client.dart';
import '../api/api_provider.dart';
import '../models/chat_response.dart';
import '../models/configuration.dart';
import '../models/task.dart' as task;

class NetworkService extends GetxService {
  static NetworkService networkService = Get.find();
  ApiClient api = ApiClient(apiProvider());
  String baseUrl = "https://95e1-103-138-236-18.ngrok-free.app/api";
}

abstract class IAppRepository {
  Future<Either<dynamic, Configuration>> getData();
  Future<Either<dynamic, List<task.Task>>> getTasks();
  Future<Either<dynamic, List<Meeting>>> getMeetings();
  Future<Either<dynamic, ChatResponse>> getAIChatResponse(String message);
  Future<Either<dynamic, List<Email>>> getEmails();
  Future<Either<dynamic, List<Slack>>> getSlackMessages();
  Future<Either<dynamic, OperationStatus>> markTaskDone(String id);
}

@Injectable(as: IAppRepository, env: [ServiceEnv.app])
class AppRepository extends IAppRepository {
  final ApiClient api = NetworkService.networkService.api;
  final String baseUrl = NetworkService.networkService.baseUrl;

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

  @override
  Future<Either<dynamic, List<task.Task>>> getTasks() async {
    dynamic response;
    try {
      response = await api.get(
        uri: '$baseUrl/task/',
      );
      final result = await compute(
        Utils.extractClassListFromJson<task.Task>,
        response["data"],
      );
      return Right(result);
    } catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<dynamic, List<Meeting>>> getMeetings() async {
    dynamic response;
    try {
      response = await api.get(
        uri: '$baseUrl/meetings/',
      );
      final result = await compute(
        Utils.extractClassListFromJson<Meeting>,
        response["data"],
      );
      return Right(result);
    } catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<dynamic, List<Email>>> getEmails() async {
    dynamic response;
    try {
      response = await api.get(
        uri: '$baseUrl/email/',
      );
      final result = await compute(
        Utils.extractClassListFromJson<Email>,
        response["data"],
      );
      return Right(result);
    } catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<dynamic, List<Slack>>> getSlackMessages() async {
    dynamic response;
    try {
      response = await api.get(
        uri: '$baseUrl/slackmessages/',
      );
      final result = await compute(
        Utils.extractClassListFromJson<Slack>,
        response["data"],
      );
      return Right(result);
    } catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<dynamic, ChatResponse>> getAIChatResponse(
      String message) async {
    dynamic response;
    try {
      final encodedMessage = Uri.encodeComponent(message);

      response = await api.post(
        uri: '$baseUrl/chat',
        queryParameters: {
          "data": encodedMessage,
        },
        // data: {
        //   "data": encodedMessage,
        // },
      );
      final result = await compute(
        Utils.extractClassFromJson<ChatResponse>,
        response,
      );
      return Right(result);
    } catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<dynamic, OperationStatus>> markTaskDone(String id) async {
    try {
      var response = await api.post(
        uri: '$baseUrl/task/status',
        data: {"task_id": '"$id"', "status": "COMPLETED"},
      );
      return const Right(OperationStatus.Success);
    } catch (exception) {
      return Left(exception);
    }
  }
}
