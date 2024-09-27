import 'package:nexus/app/data/models/class_factories.dart';

class CalendarTaskId implements JsonParsableClass {
  DateTime? time;
  String? taskId;

  CalendarTaskId({this.time, this.taskId});

  factory CalendarTaskId.fromMap(Map<String, dynamic> map) {
    return CalendarTaskId(
      time: map['time'] != null ? DateTime.parse(map['time']) : null,
      taskId: map['task_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time?.toIso8601String(),
      'task_id': taskId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalendarTaskId &&
        other.time == time &&
        other.taskId == taskId;
  }

  @override
  int get hashCode => time.hashCode ^ taskId.hashCode;
}

enum OperationStatus { Success, Failed }
