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

  RxList<Meeting> meetings = <Meeting>[].obs;

  Rxn<EmailData?> emaildata = Rxn<EmailData?>();

  Rxn<SlackData?> slackData = Rxn<SlackData?>();

  @override
  void onInit() async {
    super.onInit();
    await Future.wait(
      [
        fetchData(),
        setTasks(),
        setMeetings(),
        setEmails(),
        setSlackMessages(),
      ],
    );

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

  Future<void> setTasks() async {
    try {
      var response = await repository.getTasks();
      tasks.value = response.getRight() ?? [];
    } catch (e) {}
  }

  Future<void> setMeetings() async {
    try {
      var response = await repository.getMeetings();
      meetings.value = response.getRight() ?? [];
    } catch (e) {}
  }

  Future<void> setEmails() async {
    try {
      var response = await repository.getEmails();
      emaildata.value = response.getRight();
    } catch (e) {}
  }

  Future<void> setSlackMessages() async {
    try {
      var response = await repository.getSlackMessages();
      slackData.value = response.getRight();
    } catch (e) {}
  }
}
