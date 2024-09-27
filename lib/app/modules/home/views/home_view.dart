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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Expanded(
              flex: 6,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: ChatPage(),
              ))
        ],
      ),
    );
  }

  Widget _buildDropDown(String title) {
    return DropdownButton<String>(
      value: title,
      icon: const Icon(Icons.arrow_downward, color: Colors.black),
      underline: SizedBox(),
      onChanged: (String? newValue) {},
      items: <String>[title].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.black)),
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
      padding: EdgeInsets.all(8.0),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(number,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 16,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.actionItems.image(
                      height: 14.61,
                      width: 14.61,
                    ),
                    SizedBox(
                      width: 6.5,
                    ),
                    Text(
                      "Action Items",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 19.5 / 16,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFCECECE),
                        borderRadius: BorderRadius.circular(
                          9,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Critical Tasks",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 19.5 / 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                999,
                              ),
                            ),
                            child: Text(
                              "6",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 19.5 / 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(
                          9,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "All Tasks",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 19.5 / 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                999,
                              ),
                            ),
                            child: Text(
                              "20",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 19.5 / 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Assets.images.filter.image(
                      height: 32,
                      width: 35,
                    ),
                    SizedBox(
                      width: 7.72,
                    ),
                    Assets.images.add.image(
                      height: 32,
                      width: 35,
                    ),
                    SizedBox(
                      width: 17.69,
                    ),
                    Assets.images.expand.image(
                      width: 19,
                      height: 19,
                    )
                  ],
                ),
                SizedBox(
                  height: 16.5,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ActionItem(
                        title:
                            "Collaborate with Unilever team and update the excel sheet",
                        action: NexusAction.hackathon,
                        summary:
                            "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
                        actionId: "1",
                        source: NexusActionSource.excel,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8);
                    },
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionItemDetails() {
    return Column(
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
        child: Text("Mark as done"),
      ),
    );
  }

  Widget _buildMeetingsAndUpdates() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _buildMeetingCard(),
          SizedBox(width: 16),
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
            ListTile(
              title: Text("Today's meetings"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Unilever & The Brand tech group"),
              subtitle: Text("4:00PM - 5:00PM"),
              trailing:
                  ElevatedButton(onPressed: () {}, child: Text("PREP ME")),
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
            ListTile(
              title: Text("What's been happening"),
              subtitle: Text("September 24, 2024"),
            ),
            ListTile(
              title: Text("5 emails from @dev"),
              subtitle: Text("Lorem ipsum dolor sit amet."),
              trailing:
                  ElevatedButton(onPressed: () {}, child: Text("Summarize")),
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
            padding: EdgeInsets.all(16),
            child: Text("Chat space", style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
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
          Text('You', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(message),
          ),
          SizedBox(height: 5),
          Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
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
          Text('Prodigy', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(message),
          ),
          SizedBox(height: 5),
          Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
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
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 8),
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
            icon: Icon(Icons.send),
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
    return Center(child: Text('Mobile View'));
  }
}

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Web View'));
  }
}

class DefaultView extends StatelessWidget {
  const DefaultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Default View'));
  }
}
