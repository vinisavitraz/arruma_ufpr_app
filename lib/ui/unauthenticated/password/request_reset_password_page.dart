import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/password/request_reset_password_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestResetPasswordPage extends GetView<RequestResetPasswordPageController> {

  const RequestResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Recuperar conta',
        ),
        backgroundColor: AppColors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _labelDescription(),
              _labelFeedback(),
              _inputEmail(),
              _buttonNextPage(),
              _buttonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelFeedback() {
    return Obx(() => Visibility(
      visible: controller.feedback.value.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Text(controller.feedback.value,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.green
          ),
        ),
      ),
    ),);
  }

  Widget _labelDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text('Digite seu email para iniciar a recuperação de conta',
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
      inputEditController: controller.emailField.editController,
      errorMessage: controller.emailField.errorMessage.value,
      autoFocus: false,
      textHint: 'Email',
      keyboardType: TextInputType.emailAddress,
      onChanged: controller.emailField.setValue,
    ));
  }

  Widget _buttonNextPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: CustomButton(
          text: 'Recuperar conta',
          onPressed: controller.sendEmailResetPassword
      ),
    );
  }

  Widget _buttonLogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: CustomButton(
        backgroundColor: AppColors.primaryAccentColor,
        text: 'Voltar para o login',
        onPressed: controller.backToLoginPage
      ),
    );
  }

}