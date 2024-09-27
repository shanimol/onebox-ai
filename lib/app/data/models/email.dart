import 'package:nexus/app/data/models/class_factories.dart';
import 'user.dart';

// class EmailData implements JsonParsableClass {
//   List<Email>? emails;
//   String? summary;

//   EmailData({this.emails, this.summary});

//   factory EmailData.fromMap(Map<String, dynamic> map) {
//     return EmailData(
//       emails: map['emails'] != null
//           ? List<Email>.from(map['emails'].map((x) => Email.fromMap(x)))
//           : null,
//       summary: map['summary'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'emails': emails?.map((x) => x.toMap()).toList(),
//       'summary': summary,
//     };
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is EmailData &&
//         other.emails == emails &&
//         other.summary == summary;
//   }

//   @override
//   int get hashCode {
//     return emails.hashCode ^ summary.hashCode;
//   }
// }

class Email implements JsonParsableClass{
  String? id;
  User? sender;
  String? summary;
  DateTime? time;

  Email({this.id, this.sender, this.summary, this.time});

  factory Email.fromMap(Map<String, dynamic> map) {
    return Email(
      id: map['id'],
      sender: map['sender'] != null ? User.fromMap(map['sender']) : null,
      summary: map['summary'],
      time: map['time'] != null ? DateTime.parse(map['time']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender?.toMap(),
      'summary': summary,
      'time': time?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Email &&
        other.id == id &&
        other.sender == sender &&
        other.summary == summary &&
        other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sender.hashCode ^
        summary.hashCode ^
        time.hashCode;
  }
}