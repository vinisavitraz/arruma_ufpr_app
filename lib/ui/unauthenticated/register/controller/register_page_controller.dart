import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_password_text_field.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

import '../../../../src/user/entity/user_with_password.dart';

class RegisterPageController extends GetxController {

  final AuthRepository authRepository;
  final UserRepository userRepository;

  RegisterPageController({
    required this.authRepository,
    required this.userRepository,
  });

  RxBool validForm = false.obs;

  final MyTextField emailField = MyTextField();
  final MyPasswordTextField passwordTextField = MyPasswordTextField(maxLength: 12);
  final MyPasswordTextField confirmPasswordTextField = MyPasswordTextField(maxLength: 12);

  final MyTextField nameField = MyTextField(maxLength: 100);
  final MyTextField documentField = MyTextField(maxLength: 14, mask: '###.###.###-##');
  final MyTextField phoneNumberField = MyTextField(maxLength: 16, mask: '(##) #####-####');
  final MyTextField addressField = MyTextField(maxLength: 50);

  final Rx<UserWithPassword> userWithPassword = UserWithPassword().obs;

  void returnToLoginPage() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void dispose() {
    emailField.editController.dispose();
    passwordTextField.editController.dispose();
    confirmPasswordTextField.editController.dispose();
    addressField.editController.dispose();
    nameField.editController.dispose();
    documentField.editController.dispose();
    phoneNumberField.editController.dispose();
    super.dispose();
  }

}