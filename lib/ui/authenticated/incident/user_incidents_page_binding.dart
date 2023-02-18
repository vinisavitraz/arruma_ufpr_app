import 'package:get/get.dart';
import 'user_incidents_page_controller.dart';

class UserIncidentsPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<UserIncidentsPageController>(() {
      return UserIncidentsPageController();
    });
  }

}