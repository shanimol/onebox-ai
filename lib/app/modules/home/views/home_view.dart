import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';
import '../widgets/action_item.dart';
import '../widgets/chat.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: DashboardPage());
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text("Prodigy", style: TextStyle(color: Colors.black)),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
          _buildDropDown('Source'),
          _buildDropDown('Alerts'),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
            ),
            flex: 1,
          ),
          Expanded(
            flex: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopPriority(),
                _buildActionItems(),
                _buildMeetingsAndUpdates(),
              ],
            ),
          ),
          // Right Chat Space
          const Expanded(
            flex: 6,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ChatPage(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDropDown(String title) {
    return DropdownButton<String>(
      value: title,
      icon: const Icon(Icons.arrow_downward, color: Colors.black),
      underline: const SizedBox(),
      onChanged: (String? newValue) {},
      items: <String>[title].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(color: Colors.black)),
        );
      }).toList(),
    );
  }

  Widget _buildTopPriority() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildPriorityCard("3", "meetings"),
          _buildPriorityCard("5", "new items"),
          _buildPriorityCard("2", "Action items"),
        ],
      ),
    );
  }

  Widget _buildPriorityCard(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(number,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildActionItems() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 0.3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.task.image(
                      height: 27,
                      width: 27,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      "Tasks",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 19.5 / 16,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 33,
                      width: 33,
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFF0F0F0),
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Assets.images.expand.image(
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFBFBFB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19),
                      topRight: Radius.circular(19),
                    ),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    itemBuilder: (context, index) {
                      return const ActionItem(
                        title:
                            "Collaborate with Unilever team and update the excel sheet",
                        summary:
                            "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
                        actionId: "1",
                        source: NexusActionSource.slack,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 7);
                    },
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionItemDetails() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Summary:"),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          style: TextStyle(color: Colors.grey),
        ),
        TextField(decoration: InputDecoration(hintText: "Reply")),
      ],
    );
  }

  Widget _buildTaskRow(String taskName) {
    return ListTile(
      title: Text(taskName),
      trailing: ElevatedButton(
        onPressed: () {},
        child: const Text("Mark as done"),
      ),
    );
  }

  Widget _buildMeetingsAndUpdates() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _buildMeetingCard(),
          const SizedBox(width: 16),
          _buildUpdatesCard(),
        ],
      ),
    );
  }

  Widget _buildMeetingCard() {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            const ListTile(
              title: Text("Today's meetings"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: const Text("Unilever & The Brand tech group"),
              subtitle: const Text("4:00PM - 5:00PM"),
              trailing: ElevatedButton(
                  onPressed: () {}, child: const Text("PREP ME")),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdatesCard() {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            const ListTile(
              title: Text("What's been happening"),
              subtitle: Text("September 24, 2024"),
            ),
            ListTile(
              title: const Text("5 emails from @dev"),
              subtitle: const Text("Lorem ipsum dolor sit amet."),
              trailing: ElevatedButton(
                  onPressed: () {}, child: const Text("Summarize")),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatSpace() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text("Chat space", style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSenderMessage("Prep me for Unilever meeting", "11:30 AM"),
                _buildReceiverMessage(
                    "Lorem ipsum dolor sit amet...", "11:30 AM"),
              ],
            ),
          ),
          _buildReplyInput(),
        ],
      ),
    );
  }

  Widget _buildSenderMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('You', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(message),
          ),
          const SizedBox(height: 5),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildReceiverMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Prodigy', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(message),
          ),
          const SizedBox(height: 5),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildReplyInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Reply',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Send message functionality
            },
          ),
        ],
      ),
    );
  }
}

//
// body: Directionality(
// textDirection: TextDirection.ltr,
// child: ChatPage(),
// ));

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Mobile View'));
  }
}

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Web View'));
  }
}

class DefaultView extends StatelessWidget {
  const DefaultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Default View'));
  }
}
