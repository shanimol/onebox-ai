import 'package:collection/collection.dart';

import 'class_factories.dart';
import 'user.dart';

enum Status { PENDING, COMPLETED }

enum Source { Slack, Gmail, Meet }

class Task implements JsonParsableClass {
  String? id;
  String? content;
  String? summary;
  User? assigner;
  DateTime? date;
  Status? status;
  int? priority;
  Source? sourceType;
  String? sourceId;
  String? senderName;

  Task({
    this.id,
    this.content,
    this.summary,
    this.assigner,
    this.date,
    this.status,
    this.priority,
    this.sourceType,
    this.sourceId,
    this.senderName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'summary': summary,
      'assigner': assigner?.toMap(),
      'date': date?.toIso8601String(),
      'status': status?.toString().split('.').last,
      'priority': priority,
      'sourceType': sourceType?.toString().split('.').last,
      'sourceId': sourceId,
      'senderName': senderName,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      content: json['content'],
      summary: json['summary'],
      assigner:
          json['assigner'] != null ? User.fromMap(json['assigner']) : null,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      status: json['status'] != null
          ? Status.values.firstWhereOrNull((e) => e.name == json['status'])
          : null,
      priority: json['priority'],
      sourceType: json['sourceType'] != null
          ? Source.values.firstWhereOrNull((e) => e.name == json['sourceType'])
          : null,
      sourceId: json['source_id'],
      senderName: json['sender_name'],
    );
  }
}
