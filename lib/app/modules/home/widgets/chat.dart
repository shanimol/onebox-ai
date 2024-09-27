import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

import '../../../common/event_bus/events.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user1 = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _user2 = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
    eventBus.on<ChatEvent>().listen((event) {
      _handleMessageReceived(types.PartialText(text: event.message ?? ""));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user1,
          // theme: DefaultChatTheme(
          //   seenIcon: Text('read', style: TextStyle(fontSize: 12.0)),
          //   inputBackgroundColor: Colors.white12,
          //   backgroundColor: Colors.transparent,
          //   inputTextColor: Colors.white,
          //   primaryColor: Colors.green,
          //   secondaryColor: Colors.lightBlueAccent,
          // ),
          // typingIndicatorOptions: TypingIndicatorOptions(
          //   typingMode: TypingIndicatorMode.avatar,
          // ),
        ),
      );

  void _loadInitialMessages() {
    final replyMessage = types.TextMessage(
      author: _user2,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: 'I\'m good! How about you?',
    );

    final user1Message = types.TextMessage(
      author: _user1,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: 'Hello! How are you?',
      repliedMessage: replyMessage,
    );

    setState(() {
      _messages.insert(0, user1Message);
      // _messages.insert(0, replyMessage);
    });
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleMessageReceived(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user2,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user1,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
