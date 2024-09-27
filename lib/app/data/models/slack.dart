import 'package:nexus/app/data/models/class_factories.dart';

import 'user.dart';

// class SlackData implements JsonParsableClass {
//   List<Slack>? messages;
//   String? summary;

//   SlackData({this.messages, this.summary});

//   factory SlackData.fromMap(Map<String, dynamic> map) {
//     return SlackData(
//       messages: map['messages'] != null
//           ? List<Slack>.from(map['messages'].map((x) => Slack.fromJson(x)))
//           : null,
//       summary: map['summary'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'messages': messages?.map((x) => x.toJson()).toList(),
//       'summary': summary,
//     };
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     if (other is! SlackData) return false;
//     return messages == other.messages && summary == other.summary;
//   }

//   @override
//   int get hashCode => messages.hashCode ^ summary.hashCode;
// }

class Slack implements JsonParsableClass {
  String? id;
  User? sender;
  Channel? channel;
  String? messageType;
  String? summary;
  DateTime? time;

  Slack({
    this.id,
    this.sender,
    this.channel,
    this.messageType,
    this.summary,
    this.time,
  });

  factory Slack.fromJson(Map<String, dynamic> json) {
    return Slack(
      id: json['id'],
      sender: json['sender'] != null ? User.fromMap(json['sender']) : null,
      channel:
          json['channel'] != null ? Channel.fromJson(json['channel']) : null,
      messageType: json['message_type'],
      summary: json['summary'],
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender?.toMap(),
      'channel': channel?.toJson(),
      'message_type': messageType,
      'summary': summary,
      'time': time?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Slack) return false;
    return id == other.id &&
        sender == other.sender &&
        channel == other.channel &&
        messageType == other.messageType &&
        summary == other.summary &&
        time == other.time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sender.hashCode ^
        channel.hashCode ^
        messageType.hashCode ^
        summary.hashCode ^
        time.hashCode;
  }
}

class Channel {
  String? name;
  String? id;

  Channel({this.name, this.id});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channel_name': name,
      'channel_id': id,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Channel) return false;
    return name == other.name && id == other.id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
