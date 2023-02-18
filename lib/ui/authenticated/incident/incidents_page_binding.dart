import 'package:get/get.dart';
import 'incidents_page_controller.dart';

class IncidentsPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<IncidentsPageController>(() {
      return IncidentsPageController();
    });
  }

}