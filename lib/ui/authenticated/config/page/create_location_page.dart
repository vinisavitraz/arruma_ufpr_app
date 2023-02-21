import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/create_incident_type_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/create_location_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateLocationPage extends GetView<CreateLocationPageController> {

  const CreateLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const MyAppBar(
          title: 'Local',
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _labelDescription(),
              _labelErrorMessage(),
              _inputName(),
              _inputEmail(),
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
      textHint: 'Descrição',
      onChanged: controller.descriptionField.setValue,
      autoFocus: false,
      errorMessage: controller.descriptionField.errorMessage.value,
      inputEditController: controller.descriptionField.editController,
      keyboardType: TextInputType.name,
    ),);
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