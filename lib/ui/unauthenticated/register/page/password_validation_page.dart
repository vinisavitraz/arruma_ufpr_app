import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/password_validation_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_password_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PasswordValidationPage extends GetView<PasswordValidationPageController> {

  const PasswordValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Senha',
        ),
        backgroundColor: AppColors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _labelChoosePassword(),
              _inputPassword(),
              _inputPasswordValidation(),
              _buttonChoosePassword(),
              _divider(),
              _buttonRedirectToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelChoosePassword() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text('Agora escolha uma senha',
        style: TextStyle(
          fontSize: 18,
          color: AppColors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _inputPassword() {
    return Obx(() => CustomPasswordInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      textHint: 'Senha',
      onChanged: controller.registerPageController.passwordTextField.setValue,
      autoFocus: false,
      errorMessage: controller.registerPageController.passwordTextField.errorMessage.value,
      eyeClicked: controller.registerPageController.passwordTextField.show,
      obscureText: controller.registerPageController.passwordTextField.hideContent.value,
      inputEditController: controller.registerPageController.passwordTextField.editController,
    ),);
  }

  Widget _inputPasswordValidation() {
    return Obx(() => CustomPasswordInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      textHint: 'Repita a senha',
      onChanged: controller.registerPageController.confirmPasswordTextField.setValue,
      errorMessage: controller.registerPageController.confirmPasswordTextField.errorMessage.value,
      eyeClicked: controller.registerPageController.confirmPasswordTextField.show,
      obscureText: controller.registerPageController.confirmPasswordTextField.hideContent.value,
      inputEditController: controller.registerPageController.confirmPasswordTextField.editController,
    ),);
  }

  Widget _buttonChoosePassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: CustomButton(
        text: 'Confirmar',
        onPressed: controller.validatePasswords,
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: DividerComponent(),
    );
  }

  Widget _buttonRedirectToLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: controller.registerPageController.returnToLoginPage,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Já possui uma conta? ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            Text('Clique aqui',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

}