import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/password/request_reset_password_page_controller.dart';
import 'package:get/get.dart';

class RequestResetPasswordPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<RequestResetPasswordPageController>(() {
      return RequestResetPasswordPageController(
        userRepository: UserRepository(),
      );
    });
  }
}