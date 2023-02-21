import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/create_user_page_controller.dart';
import 'package:get/get.dart';

class CreateUserPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CreateUserPageController>(() {
      return CreateUserPageController(
        userRepository: UserRepository(),
      );
    });
  }

}