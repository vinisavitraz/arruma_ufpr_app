import 'package:arruma_ufpr_app/src/profile/repository/profile_repository.dart';
import 'package:get/get.dart';
import 'profile_page_controller.dart';

class ProfilePageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() {
      return ProfilePageController(
        profileRepository: ProfileRepository(),
      );
    });
  }

}