import 'package:arruma_ufpr_app/src/config/repository/config_repository.dart';
import 'package:get/get.dart';
import 'config_page_controller.dart';

class ConfigPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ConfigPageController>(() {
      return ConfigPageController(
        configRepository: ConfigRepository(),
      );
    });
  }

}