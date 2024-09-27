import 'package:nexus/app/data/models/task.dart';

import 'class_factories.dart';

class CalendarTask implements JsonParsableClass {
  DateTime? date;
  Task? task;

  CalendarTask({this.date, this.task});

  factory CalendarTask.fromMap(Map<String, dynamic> map) {
    return CalendarTask(
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      task: map['task'] != null ? Task.fromMap(map['task']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date?.toIso8601String(),
      'task': task?.toMap(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalendarTask && other.date == date && other.task == task;
  }

  @override
  int get hashCode => date.hashCode ^ task.hashCode;
}
