import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'login_page_controller.dart';

class LoginPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() {
      return LoginPageController(
        authRepository: AuthRepository(),
      );
    });
  }

}