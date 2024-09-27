import 'package:get/get.dart';
import 'package:nexus/app/common/util/extensions.dart';
import 'package:nexus/app/data/models/calendar_task.dart';
import 'package:nexus/app/data/models/email.dart';
import 'package:nexus/app/data/models/meeting.dart';
import 'package:nexus/app/data/models/slack.dart';
import 'package:nexus/app/data/models/task.dart';
import 'package:nexus/app/data/models/user.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../data/models/configuration.dart';
import '../../../data/repository/app.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final IAppRepository repository;
  final sideBarController =
      SidebarXController(selectedIndex: 0, extended: true);
  final RxInt selectedNavbarIndex = 0.obs;
  final RxInt taskCardSectionIndex = 0.obs;
  
  HomeController({required this.repository});

  final count = 0.obs;

  Rxn<Configuration> appData = Rxn<Configuration>();
  RxList<CalendarTask> calendarTask = <CalendarTask>[].obs;

  RxList<Task> tasks = <Task>[].obs;

  @override
  void onInit() async {
    super.onInit();
    appData.value = (await repository.getData()).getRight();
    tasks.value = [
      Task(
        id: "id1",
        title: "UI Changes",
        summary:
            "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
        date: DateTime.now().subtract(
          Duration(
            hours: 4,
          ),
        ),
        status: Status.Pending,
        priority: 3,
        sourceType: Source.Slack,
        sourceId: "sid1",
      ),
      Task(
        id: "id2",
        title: "Figma Handover",
        summary:
            "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
        date: DateTime.now().subtract(
          Duration(
            hours: 2,
          ),
        ),
        status: Status.Pending,
        priority: 7,
        sourceType: Source.Gmail,
        sourceId: "sid2",
      ),
      Task(
        id: "id11",
        title: "Sprint Planning",
        summary:
            "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
        date: DateTime.now().subtract(
          Duration(
            hours: 2,
          ),
        ),
        status: Status.Pending,
        priority: 7,
        sourceType: Source.Gmail,
        sourceId: "sid2",
      ),
      Task(
        id: "id3",
        title: "Reply to mail",
        summary:
            "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
        date: DateTime.now().add(
          Duration(
            hours: 2,
          ),
        ),
        status: Status.Pending,
        priority: 9,
        sourceType: Source.Meet,
        sourceId: "sid3",
      ),
      Task(
        id: "id4",
        title: "Fix Bugs",
        summary:
            "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
        date: DateTime.now().subtract(
          Duration(
            hours: 8,
          ),
        ),
        status: Status.Pending,
        priority: 0,
        sourceType: Source.Slack,
        sourceId: "sid4",
      ),
    ];
    calendarTask.value = List.generate(
      15,
      (index) {
        return CalendarTask(
          date: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            5 + index,
          ),
        );
      },
    );
  }

  List<Meeting> meetingsList = [
    Meeting(
      id: '1',
      title: 'Team Sync',
      description: 'Weekly team sync-up meeting',
      summary: 'Discussion on project updates and blockers',
      startTime: DateTime(2024, 9, 28, 10, 0),
      endTime: DateTime(2024, 9, 28, 11, 0),
      guests: [
        User(
            id: '101',
            firstName: 'Alice',
            lastName: 'Smith',
            avatarUrl: 'https://example.com/avatar1.png'),
        User(
            id: '102',
            firstName: 'Bob',
            lastName: 'Johnson',
            avatarUrl: 'https://example.com/avatar2.png')
      ],
    ),
    Meeting(
      id: '2',
      title: 'Client Meeting',
      description: 'Quarterly review with the client',
      summary: 'Reviewing project status and deliverables',
      startTime: DateTime(2024, 9, 29, 14, 0),
      endTime: DateTime(2024, 9, 29, 15, 0),
      guests: [
        User(
            id: '103',
            firstName: 'Charlie',
            lastName: 'Brown',
            avatarUrl: 'https://example.com/avatar3.png'),
        User(
            id: '104',
            firstName: 'Diana',
            lastName: 'Garcia',
            avatarUrl: 'https://example.com/avatar4.png')
      ],
    ),
    Meeting(
      id: '3',
      title: 'Product Demo',
      description: 'Demo of the new product features',
      summary: 'Showcasing the latest updates to the client',
      startTime: DateTime(2024, 9, 30, 16, 0),
      endTime: DateTime(2024, 9, 30, 17, 0),
      guests: [
        User(
            id: '105',
            firstName: 'Eve',
            lastName: 'Davis',
            avatarUrl: 'https://example.com/avatar5.png'),
        User(
            id: '106',
            firstName: 'Frank',
            lastName: 'Miller',
            avatarUrl: 'https://example.com/avatar6.png')
      ],
    ),
    Meeting(
      id: '4',
      title: '1-on-1 Check-in',
      description: 'Monthly 1-on-1 meeting with the manager',
      summary: 'Discussion on career progress and feedback',
      startTime: DateTime(2024, 10, 1, 9, 30),
      endTime: DateTime(2024, 10, 1, 10, 0),
      guests: [
        User(
            id: '107',
            firstName: 'Grace',
            lastName: 'Lee',
            avatarUrl: 'https://example.com/avatar7.png')
      ],
    ),
    Meeting(
      id: '5',
      title: 'Design Review',
      description: 'Review of the latest design mockups',
      summary: 'Feedback session on new design ideas',
      startTime: DateTime(2024, 10, 2, 13, 0),
      endTime: DateTime(2024, 10, 2, 14, 0),
      guests: [
        User(
            id: '108',
            firstName: 'Heidi',
            lastName: 'Taylor',
            avatarUrl: 'https://example.com/avatar8.png'),
        User(
            id: '109',
            firstName: 'Ivan',
            lastName: 'Martinez',
            avatarUrl: 'https://example.com/avatar9.png')
      ],
    ),
    Meeting(
      id: '6',
      title: 'Team Sync',
      description: 'Weekly team sync-up meeting',
      summary: 'Discussion on project updates and blockers',
      startTime: DateTime(2024, 9, 23, 10, 0),
      endTime: DateTime(2024, 9, 23, 11, 0),
      guests: [
        User(
            id: '101',
            firstName: 'Alice',
            lastName: 'Smith',
            avatarUrl: 'https://example.com/avatar1.png'),
        User(
            id: '102',
            firstName: 'Bob',
            lastName: 'Johnson',
            avatarUrl: 'https://example.com/avatar2.png')
      ],
    ),
  ];

  List<Email> emailList = [
    Email(
      id: '1',
      sender: User(
        id: '101',
        firstName: 'Alice',
        lastName: 'Smith',
        avatarUrl: 'https://example.com/avatars/alice.jpg',
      ),
      summary: 'Meeting Reminder',
      time: DateTime.now().subtract(Duration(hours: 1)),
    ),
    Email(
      id: '2',
      sender: User(
        id: '102',
        firstName: 'Bob',
        lastName: 'Johnson',
        avatarUrl: 'https://example.com/avatars/bob.jpg',
      ),
      summary: 'Project Update',
      time: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Email(
      id: '3',
      sender: User(
        id: '103',
        firstName: 'Carol',
        lastName: 'Williams',
        avatarUrl: 'https://example.com/avatars/carol.jpg',
      ),
      summary: 'Invitation to Event',
      time: DateTime.now().subtract(Duration(hours: 3)),
    ),
    Email(
      id: '4',
      sender: User(
        id: '104',
        firstName: 'David',
        lastName: 'Brown',
        avatarUrl: 'https://example.com/avatars/david.jpg',
      ),
      summary: 'Feedback Requested',
      time: DateTime.now().subtract(Duration(hours: 4)),
    ),
    Email(
      id: '5',
      sender: User(
        id: '105',
        firstName: 'Eva',
        lastName: 'Jones',
        avatarUrl: 'https://example.com/avatars/eva.jpg',
      ),
      summary: 'Quarterly Report',
      time: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ];

  List<Slack> slackList = [
    Slack(
      id: '1',
      sender: User(
        id: 'u1',
        firstName: 'Alice',
        lastName: 'Smith',
        avatarUrl: 'https://example.com/avatar1.png',
      ),
      channel: Channel(
        channelId: 'c1',
        channelName: 'general',
      ),
      messageType: 'text',
      summary: 'Team meeting scheduled for tomorrow.',
      time: DateTime.now().subtract(Duration(hours: 1)),
    ),
    Slack(
      id: '2',
      sender: User(
        id: 'u2',
        firstName: 'Bob',
        lastName: 'Johnson',
        avatarUrl: 'https://example.com/avatar2.png',
      ),
      channel: Channel(
        channelId: 'c1',
        channelName: 'general',
      ),
      messageType: 'text',
      summary: 'Please review the latest project updates.',
      time: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Slack(
      id: '3',
      sender: User(
        id: 'u3',
        firstName: 'Charlie',
        lastName: 'Brown',
        avatarUrl: 'https://example.com/avatar3.png',
      ),
      channel: Channel(
        channelId: 'c2',
        channelName: 'random',
      ),
      messageType: 'text',
      summary: 'Just sharing some fun memes!',
      time: DateTime.now().subtract(Duration(hours: 3)),
    ),
    Slack(
      id: '4',
      sender: User(
        id: 'u4',
        firstName: 'Diana',
        lastName: 'Prince',
        avatarUrl: 'https://example.com/avatar4.png',
      ),
      channel: Channel(
        channelId: 'c3',
        channelName: 'dev',
      ),
      messageType: 'text',
      summary: 'Code review requested for pull request #42.',
      time: DateTime.now().subtract(Duration(hours: 4)),
    ),
    Slack(
      id: '5',
      sender: User(
        id: 'u5',
        firstName: 'Edward',
        lastName: 'Norton',
        avatarUrl: 'https://example.com/avatar5.png',
      ),
      channel: Channel(
        channelId: 'c1',
        channelName: 'general',
      ),
      messageType: 'text',
      summary: 'Reminder: Submit your timesheets by Friday.',
      time: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ];

  Future<void> fetchData() async {
    appData.value = (await repository.getData()).getRight();
  }

  Future<void> getResponse(String? message) async {
    appData.value = (await repository.getData()).getRight();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
