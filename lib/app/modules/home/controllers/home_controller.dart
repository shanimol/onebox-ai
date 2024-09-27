import 'package:get/get.dart';
import 'package:nexus/app/common/util/extensions.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../data/models/configuration.dart';
import '../../../data/repository/app.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final IAppRepository repository;
  final sideBarController =
      SidebarXController(selectedIndex: 0, extended: true);
  final RxInt selectedNavbarIndex = 0.obs;

  HomeController({required this.repository});

  final count = 0.obs;

  Rxn<Configuration> appData = Rxn<Configuration>();

  @override
  void onInit() async {
    super.onInit();
    appData.value = (await repository.getData()).getRight();
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
}
