import 'package:get/get.dart';
import 'package:nexus/app/common/util/extensions.dart';
import 'package:nexus/app/data/models/calendar_task.dart';
import 'package:nexus/app/data/models/task.dart';

import '../../../data/models/configuration.dart';
import '../../../data/repository/app.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final IAppRepository repository;

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
        summary: "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
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
        summary: "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
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
        summary: "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
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
        summary: "Lorem ipsum dolor sit amet consectetur. Malesuada sem vestibulum mi in amet amet libero eget. Sociis aliquam sed id diam non quam purus morbi. Id at gravida aliquet a metus duis eget tincidunt diam. Sit nunc nisl pulvinar sit proin diam massa. Cursus dictum ut tristique integer. Sed id orci tempus a. Et risus blandit dolor rutrum.",
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
