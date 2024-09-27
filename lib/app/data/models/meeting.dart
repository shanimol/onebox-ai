import 'package:nexus/app/data/models/class_factories.dart';
import 'user.dart';

class Meeting implements JsonParsableClass {
  String? id;
  String? title;
  String? description;
  String? summary;
  DateTime? startTime;
  DateTime? endTime;
  List<User>? guests;

  Meeting({
    this.id,
    this.title,
    this.description,
    this.summary,
    this.startTime,
    this.endTime,
    this.guests,
  });

  factory Meeting.fromMap(Map<String, dynamic> map) {
    return Meeting(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      summary: map['summary'],
      startTime: map['start_time'] != null ? DateTime.parse(map['start_time']) : null,
      endTime: map['end_time'] != null ? DateTime.parse(map['end_time']) : null,
      guests: map['guests'] != null ? List<User>.from(map['guests'].map((x) => User.fromMap(x))) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'summary': summary,
      'start_time': startTime?.toIso8601String(),
      'end_time': endTime?.toIso8601String(),
      'guests': guests?.map((x) => x.toMap()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Meeting &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.summary == summary &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.guests == guests;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        summary.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        guests.hashCode;
  }
}