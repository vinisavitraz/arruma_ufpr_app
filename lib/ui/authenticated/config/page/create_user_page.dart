import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/create_user_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_select_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends GetView<CreateUserPageController> {

  const CreateUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const MyAppBar(
          title: 'Usuário',
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _labelDescription(),
              _labelErrorMessage(),
              _inputName(),
              _inputEmail(),
              _inputDocument(),
              _inputPhone(),
              _inputAddress(),
              _inputRole(),
              _buttonSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelDescription() {
    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(controller.labelDescription.value,
        style: TextStyle(
            fontSize: 18,
            color: AppColors.black
        ),
        textAlign: TextAlign.center,
      ),
    ),);
  }

  Widget _labelErrorMessage() {
    return Obx(() => Visibility(
      visible: controller.errorMessage.value.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Text(controller.errorMessage.value,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.red
          ),
        ),
      ),
    ),);
  }

  Widget _inputName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.nameField.setValue,
      autoFocus: false,
      errorMessage: controller.nameField.errorMessage.value,
      inputEditController: controller.nameField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputEmail() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      textHint: 'Email',
      onChanged: controller.emailField.setValue,
      autoFocus: false,
      errorMessage: controller.emailField.errorMessage.value,
      inputEditController: controller.emailField.editController,
      keyboardType: TextInputType.emailAddress,
    ),);
  }

  Widget _inputDocument() {
    return CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      textHint: 'CPF',
      onChanged: controller.documentField.setValue,
      autoFocus: false,
      errorMessage: controller.documentField.errorMessage.value,
      inputEditController: controller.documentField.editController,
      maxLength: 14,
      mask: controller.documentField.maskFormatter,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _inputPhone() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Telefone',
      onChanged: controller.phoneNumberField.setValue,
      autoFocus: false,
      errorMessage: controller.phoneNumberField.errorMessage.value,
      inputEditController: controller.phoneNumberField.editController,
      maxLength: 25,
      mask: controller.phoneNumberField.maskFormatter,
      keyboardType: TextInputType.phone,
    ),);
  }

  Widget _inputAddress() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Endereço',
      onChanged: controller.addressField.setValue,
      autoFocus: false,
      errorMessage: controller.addressField.errorMessage.value,
      inputEditController: controller.addressField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputRole() {
    return CustomSelectInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textField: controller.roleField,
      textHint: 'Tipo',
      options: controller.roleOptions,
      onChanged: controller.roleField.setValue,
    );
  }

  Widget _buttonSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: CustomButton(
        text: 'Salvar',
        onPressed: controller.save,
      ),
    );
  }

}