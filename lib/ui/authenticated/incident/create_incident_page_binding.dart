import 'package:get/get.dart';
import 'create_incident_page_controller.dart';

class CreateIncidentPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CreateIncidentPageController>(() {
      return CreateIncidentPageController();
    });
  }

}