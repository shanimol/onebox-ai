import 'package:nexus/app/data/models/slack.dart';
import 'package:nexus/app/data/models/task.dart';

import 'email.dart';
import 'meeting.dart';

class ClassFactories {
  ClassFactories._();

  static final classFactoriesMap = <Type, Function>{
    // User: (dynamic x) => User.fromJson(x),
    Task: (dynamic x) => Task.fromMap(x),
    Meeting: (dynamic x) => Meeting.fromMap(x),
    EmailData: (dynamic x) => EmailData.fromMap(x),
    SlackData: (dynamic x) => SlackData.fromMap(x),
  };
}

abstract class JsonParsableClass {
  JsonParsableClass.fromJson();
}
