import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/document_validation_page_controller.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/register_page_controller.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/unauthenticated_page_controller.dart';
import 'package:get/get.dart';

class DocumentValidationPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnauthenticatedController>(() {
      return UnauthenticatedController();
    });
    Get.lazyPut<RegisterPageController>(() {
      return RegisterPageController(
        authRepository: AuthRepository(),
        userRepository: UserRepository(),
      );
    });
    Get.lazyPut<DocumentValidationPageController>(() {
      return DocumentValidationPageController(
        userRepository: UserRepository(),
      );
    });
  }
}