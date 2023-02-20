import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_images.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_password_input.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_input.dart';
import '../../widgets/divider_component.dart';
import 'login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _imageMIB(context),
              _formUserLogin(context),
              _divider(),
              //_textCreateUser(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageMIB(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Image.asset(
        AppImages.logo,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }

  Widget _formUserLogin(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => CustomTextInput(
          paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          textHint: 'Email',
          onChanged: (value) => {controller.emailField.setValue(value)},
          errorMessage: controller.emailField.errorMessage.value,
          inputEditController: controller.emailField.editController,
          autoFocus: false,
          maxLength: controller.emailField.maxLength,
          keyboardType: TextInputType.emailAddress,
        ),),
        Obx(() => CustomPasswordInput(
          paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          textHint: 'Senha',
          onChanged: (value) => {controller.passwordField.setValue(value)},
          errorMessage: controller.passwordField.errorMessage.value,
          inputEditController: controller.passwordField.editController,
          obscureText: controller.passwordField.hideContent.value,
          eyeClicked: controller.passwordField.show,
          autoFocus: false,
        ),),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: controller.resetPassword,
              child: const Text('Recuperar senha',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: CustomButton(
            backgroundColor: AppColors.primaryColor,
            text: 'Acessar',
            onPressed: controller.authUser,
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: DividerComponent(),
    );
  }

  Widget _textCreateUser() {
    return InkWell(
      onTap: controller.navigateToRegister,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Não possui uma conta? ',
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
    );
  }

}