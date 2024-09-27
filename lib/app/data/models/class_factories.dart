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
    Email: (dynamic x) => Email.fromMap(x),
    Slack: (dynamic x) => Slack.fromJson(x),
  };
}

abstract class JsonParsableClass {
  JsonParsableClass.fromJson();
}
