import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/users_page_controller.dart';
import 'package:get/get.dart';

class UsersPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<UsersPageController>(() {
      return UsersPageController(
        userRepository: UserRepository(),
      );
    });
  }

}