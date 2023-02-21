import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/profile_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/update_password_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_password_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UpdatePasswordPage extends GetView<UpdatePasswordPageController> {

  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const MyAppBar(
          title: 'Senha',
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _labelDescription(),
              _labelFeedback(),
              _labelErrorFeedback(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Nova senha',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(() => CustomPasswordInput(
                      textHint: 'Nova senha',
                      onChanged: controller.newPasswordField.setValue,
                      autoFocus: false,
                      errorMessage: controller.newPasswordField.errorMessage.value,
                      eyeClicked: controller.newPasswordField.show,
                      obscureText: controller.newPasswordField.hideContent.value,
                      inputEditController: controller.newPasswordField.editController,
                    ),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Repetir nova senha',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(() => CustomPasswordInput(
                      textHint: 'Repetir nova senha',
                      onChanged: controller.repeatedNewPasswordField.setValue,
                      errorMessage: controller.repeatedNewPasswordField.errorMessage.value,
                      eyeClicked: controller.repeatedNewPasswordField.show,
                      obscureText: controller.repeatedNewPasswordField.hideContent.value,
                      inputEditController: controller.repeatedNewPasswordField.editController,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: CustomButton(
                    text: 'Trocar senha',
                    onPressed: controller.changePassword
                ),
              ),
              // _inputName(),
              // _inputEmail(),
              // _inputDocument(),
              // _inputPhone(),
              // _inputAddress(),
              // _buttonSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text('Chegou a hora de escolher a nova senha',
        style: TextStyle(
            fontSize: 18,
            color: AppColors.black
        ),
        textAlign: TextAlign.center,
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
              color: AppColors.primaryColor
          ),
        ),
      ),
    ),);
  }

  Widget _labelErrorFeedback() {
    return Obx(() => Visibility(
      visible: controller.feedbackError.value.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Text(controller.feedbackError.value,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.red
          ),
        ),
      ),
    ),);
  }

  // Widget _inputName() {
  //   return Obx(() => CustomTextInput(
  //     paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  //     textHint: 'Nome',
  //     onChanged: controller.nameField.setValue,
  //     autoFocus: false,
  //     errorMessage: controller.nameField.errorMessage.value,
  //     inputEditController: controller.nameField.editController,
  //     keyboardType: TextInputType.name,
  //   ),);
  // }
  //
  // Widget _inputEmail() {
  //   return Obx(() => CustomTextInput(
  //     paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
  //     textHint: 'Email',
  //     onChanged: controller.emailField.setValue,
  //     autoFocus: false,
  //     errorMessage: controller.emailField.errorMessage.value,
  //     inputEditController: controller.emailField.editController,
  //     keyboardType: TextInputType.emailAddress,
  //   ),);
  // }
  //
  // Widget _inputDocument() {
  //   return CustomTextInput(
  //     paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
  //     textHint: 'CPF',
  //     enabled: false,
  //     onChanged: controller.documentField.setValue,
  //     autoFocus: false,
  //     errorMessage: controller.documentField.errorMessage.value,
  //     inputEditController: controller.documentField.editController,
  //     maxLength: 14,
  //     mask: controller.documentField.maskFormatter,
  //     keyboardType: TextInputType.phone,
  //   );
  // }
  //
  // Widget _inputPhone() {
  //   return Obx(() => CustomTextInput(
  //     paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  //     textHint: 'Telefone',
  //     onChanged: controller.phoneNumberField.setValue,
  //     autoFocus: false,
  //     errorMessage: controller.phoneNumberField.errorMessage.value,
  //     inputEditController: controller.phoneNumberField.editController,
  //     maxLength: 25,
  //     mask: controller.phoneNumberField.maskFormatter,
  //     keyboardType: TextInputType.phone,
  //   ),);
  // }
  //
  // Widget _inputAddress() {
  //   return Obx(() => CustomTextInput(
  //     paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  //     textHint: 'Endereço',
  //     onChanged: controller.addressField.setValue,
  //     autoFocus: false,
  //     errorMessage: controller.addressField.errorMessage.value,
  //     inputEditController: controller.addressField.editController,
  //     keyboardType: TextInputType.name,
  //   ),);
  // }
  //
  // Widget _buttonSave() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
  //     child: CustomButton(
  //       text: 'Salvar',
  //       onPressed: controller.updateUser,
  //     ),
  //   );
  // }

}