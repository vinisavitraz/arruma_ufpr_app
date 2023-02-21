import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/email_validation_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EmailValidationPage extends GetView<EmailValidationPageController> {

  const EmailValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Criar nova conta',
        ),
        backgroundColor: AppColors.white,
        body: Obx(() => controller.pageLoading.value ?
          Center(
            child: CircularProgressIndicator(),
          ) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  _labelStartRegister(),
                  _inputEmail(),
                  _buttonValidate(),
                  _divider(),
                  _buttonRedirectToLogin(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelStartRegister() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text('Para iniciar seu cadastro, informe seu email',
        style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _inputEmail() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      textHint: 'Email',
      onChanged: controller.registerPageController.emailField.setValue,
      autoFocus: false,
      errorMessage: controller.registerPageController.emailField.errorMessage.value,
      inputEditController: controller.registerPageController.emailField.editController,
      keyboardType: TextInputType.emailAddress,
    ),);
  }

  Widget _buttonValidate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: CustomButton(
        text: 'Validar',
        onPressed: controller.validateEmail,
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