import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/user_info_validation_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserInfoValidationPage extends GetView<UserInfoValidationPageController> {

  const UserInfoValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const MyAppBar(
          title: 'Dados',
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _labelDescription(),
              _labelErrorMessage(),
              _inputName(),
              _inputPhone(),
              _inputAddress(),
              _buttonNextPage(),
              _divider(),
              _buttonRedirectToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text('Informe seu dados',
        style: TextStyle(
            fontSize: 18,
            color: AppColors.black
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _labelErrorMessage() {
    return Obx(() => Visibility(
      visible: controller.errorMessage.value.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(controller.errorMessage.value,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryAccentColor
          ),
        ),
      ),
    ),);
  }

  Widget _inputName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.registerPageController.nameField.setValue,
      autoFocus: false,
      errorMessage: controller.registerPageController.nameField.errorMessage.value,
      inputEditController: controller.registerPageController.nameField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputPhone() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Telefone',
      onChanged: controller.registerPageController.phoneNumberField.setValue,
      autoFocus: false,
      errorMessage: controller.registerPageController.phoneNumberField.errorMessage.value,
      inputEditController: controller.registerPageController.phoneNumberField.editController,
      maxLength: 25,
      mask: controller.registerPageController.phoneNumberField.maskFormatter,
      keyboardType: TextInputType.phone,
    ),);
  }

  Widget _inputAddress() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Endereço',
      onChanged: controller.registerPageController.addressField.setValue,
      autoFocus: false,
      errorMessage: controller.registerPageController.addressField.errorMessage.value,
      inputEditController: controller.registerPageController.addressField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _buttonNextPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: CustomButton(
        text: 'Continuar',
        onPressed: controller.validateUserInfo,
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