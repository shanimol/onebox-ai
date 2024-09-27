import 'class_factories.dart';

class ChatResponse implements JsonParsableClass {
  final bool? success;
  final String? message;

  ChatResponse({required this.success, required this.message});

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}

// class ChatMessage implements JsonParsableClass {
//   final String? message;
//
//   ChatMessage({ required this.message});
//
//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       message: json['message'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//     };
//   }
// }
