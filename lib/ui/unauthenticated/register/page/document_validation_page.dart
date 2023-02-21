import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/divider_component.dart';
import '../controller/document_validation_page_controller.dart';

class DocumentValidationPage extends GetView<DocumentValidationPageController> {

  const DocumentValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Documento',
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
              _labelInputDocument(),
              _inputDocument(),
              _buttonValidate(),
              _divider(),
              _buttonRedirectToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelInputDocument() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text('Digite o seu CPF',
        style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
        ),
      ),
    );
  }

  Widget _inputDocument() {
    return CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      textHint: 'CPF',
      onChanged: controller.registerPageController.documentField.setValue,
      autoFocus: false,
      errorMessage: controller.registerPageController.documentField.errorMessage.value,
      inputEditController: controller.registerPageController.documentField.editController,
      maxLength: 14,
      mask: controller.registerPageController.documentField.maskFormatter,
      keyboardType: TextInputType.number,
    );
  }

  Widget _buttonValidate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: CustomButton(
        text: 'Confirmar',
        onPressed: controller.validateDocument,
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