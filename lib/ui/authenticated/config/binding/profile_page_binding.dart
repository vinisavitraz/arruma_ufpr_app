import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/profile_page_controller.dart';
import 'package:get/get.dart';

class ProfilePageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() {
      return ProfilePageController(
        userRepository: UserRepository(),
      );
    });
  }

}