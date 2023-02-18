import 'package:get/get.dart';
import 'incident_page_controller.dart';

class IncidentPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<IncidentPageController>(() {
      return IncidentPageController();
    });
  }

}