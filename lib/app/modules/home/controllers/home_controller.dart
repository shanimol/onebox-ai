import 'package:get/get.dart';
import 'package:nexus/app/common/util/extensions.dart';
import 'package:nexus/app/data/models/calendar_task.dart';
import 'package:nexus/app/data/models/email.dart';
import 'package:nexus/app/data/models/meeting.dart';
import 'package:nexus/app/data/models/slack.dart';
import 'package:nexus/app/data/models/task.dart';
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

  RxList<Email> emaildata = RxList<Email>();

  RxList<Slack> slackData = RxList<Slack>();

  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
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
    await Future.wait(
      [
        fetchData(),
        setTasks(),
        setMeetings(),
        setEmails(),
        setSlackMessages(),
      ],
    );
    await setCalendarTasks();
    isLoading.value = false;
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
      emaildata.value = response.getRight() ?? [];
    } catch (e) {}
  }

  Future<void> setSlackMessages() async {
    try {
      var response = await repository.getSlackMessages();
      slackData.value = response.getRight() ?? [];
    } catch (e) {}
  }

  Future<void> markTaskDone(String taskId) async {
    try {
      var response = await repository.markTaskDone(
        taskId,
      );
      if (response.isRight()) {
        var index = tasks.indexWhere(
          (Task element) => element.id == taskId,
        );
        tasks[index].status = Status.COMPLETED;
        tasks.refresh();
      }
    } catch (e) {}
  }

  Future<void> setCalendarTasks() async {
    try {
      var response = await repository.getCalendarTaskList();
      if (response.isRight()) {
        var list = response.getRight() ?? [];
        for (var element in list) {
          if (element.time?.day == DateTime.now().day &&
              element.time?.month == DateTime.now().month &&
              element.time?.year == DateTime.now().year) {
            if ((element.time?.hour ?? 0) >= 5 &&
                (element.time?.hour ?? 0) <= 19) {
              calendarTask[(element.time?.hour ?? 5) - 5].task =
                  tasks.firstWhereOrNull(
                (task) => element.taskId == task.id,
              );
              calendarTask.refresh();
            }
          }
        }
      }
    } catch (e) {}
  }

  Future<void> setTaskForCalendar(int index) async {
    var calendarTaskItem = calendarTask[index];
    repository.setCalendarTask(
      calendarTaskItem.task?.id,
      calendarTaskItem.date ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
    );
  }
}
