import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/update_password_page_controller.dart';
import 'package:get/get.dart';

class UpdatePasswordPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<UpdatePasswordPageController>(() {
      return UpdatePasswordPageController(
        userRepository: UserRepository(),
      );
    });
  }

}