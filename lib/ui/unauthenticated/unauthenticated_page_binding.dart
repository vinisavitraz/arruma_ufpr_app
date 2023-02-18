import 'package:arruma_ufpr_app/ui/unauthenticated/unauthenticated_page_controller.dart';
import 'package:get/get.dart';

class UnauthenticatedPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<UnauthenticatedController>(() {
      return UnauthenticatedController();
    });
  }

}