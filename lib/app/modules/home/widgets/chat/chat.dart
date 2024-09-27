import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/app/modules/home/widgets/chat/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:uuid/uuid.dart';

import '../../../../common/event_bus/events.dart';
import '../../../../common/values/app_colors.dart';

class ChatPage extends StatefulWidget {
  final HomeController controller;
  final bool shouldShowList;
  ChatPage({Key? key, required this.controller, this.shouldShowList = true})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  List<types.Message> _messages = [];
  final _user1 = const types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
      firstName: 'John',
      lastName: 'Doe');
  final _user2 = const types.User(
      id: '72091008-a484-4a89-ae75-a22bf8d6f3ac',
      firstName: 'Jane',
      lastName: 'Na');

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
    eventBus.on<ChatEvent>().listen((event) {
      _handleSendPressed(types.PartialText(text: event.message ?? ""));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 1000;
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: canvasColor,
                  title: Text(_getTitleByIndex(_controller.selectedIndex)),
                  leading: IconButton(
                    onPressed: () {
                      // if (!Platform.isAndroid && !Platform.isIOS) {
                      //   _controller.setExtended(true);
                      // }
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: ExampleSidebarX(controller: _controller),
          body: Row(
            children: [
              if (widget.shouldShowList)
                ExampleSidebarX(controller: _controller),
              Expanded(
                child: Center(
                    child: Chat(
                  messages: _messages,
                  onSendPressed: _handleSendPressed,
                  user: _user1,
                  theme: DefaultChatTheme(
                      backgroundColor: Color(0xFFFAFAFA),
                      sendButtonIcon: SendIconWidget(),
                      inputPadding: const EdgeInsets.all(10),
                      inputTextColor: AppColors.black,
                      inputContainerDecoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: AppColors.black11.withOpacity(.2),
                        ),
                      ),
                      inputBackgroundColor: AppColors.white),
                )
                    // ScreensExample(
                    //   controller: _controller,
                    // ),
                    ),
              ),
            ],
          ),
        );
      },
    ));
  }

  void _loadInitialMessages() async {
    // final user1Message = types.TextMessage(
    //   author: _user1,
    //   createdAt: DateTime.now().millisecondsSinceEpoch,
    //   id: const Uuid().v4(),
    //   text: 'Hello! How are you?',
    // );
    //
    // final replyMessage = types.TextMessage(
    //   author: _user2,
    //   createdAt: DateTime.now().millisecondsSinceEpoch,
    //   id: const Uuid().v4(),
    //   text: 'I\'m good! How about you?',
    // );
    // setState(() {
    //   _messages = [replyMessage, user1Message];
    //   // _messages.insert(0, replyMessage);
    // });

    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
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

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user1,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    (await widget.controller.repository.getData())?.fold((l) {
      _handleMessageReceived(
          types.PartialText(text: "Wait for sometime...Sell your dreams"));
    }, (r) {
      _handleMessageReceived(types.PartialText(text: "Message Received"));
    });
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

class SendIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black, // Background color
        shape: BoxShape.circle, // Circular shape
      ),
      child: IconButton(
        icon: Icon(
          Icons.send,
          color: Colors.white,
        ),
        color: Colors.white, onPressed: null, // Icon color
      ),
    );
  }
}
