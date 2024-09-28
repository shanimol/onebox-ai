import 'package:nexus/app/data/models/class_factories.dart';

class CalendarTaskId implements JsonParsableClass {
  String? id;
  DateTime? time;
  String? taskId;

  CalendarTaskId({this.id, this.time, this.taskId});

  factory CalendarTaskId.fromMap(Map<String, dynamic> map) {
    return CalendarTaskId(
      id: map['id'],
      time: map['time'] != null ? DateTime.parse(map['time']) : null,
      taskId: map['task_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time?.toIso8601String(),
      'task_id': taskId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalendarTaskId &&
        other.id == id &&
        other.time == time &&
        other.taskId == taskId;
  }

  @override
  int get hashCode => id.hashCode ^ time.hashCode ^ taskId.hashCode;
}

enum OperationStatus { Success, Failed }
