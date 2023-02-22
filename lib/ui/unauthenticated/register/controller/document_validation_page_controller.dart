import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/commons/validation/document_validator.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentValidationPageController extends GetxController {

  final UserRepository userRepository;
  final RxBool pageLoading = false.obs;

  DocumentValidationPageController({
    required this.userRepository,
  });

  final RegisterPageController registerPageController = Get.find();

  void validateDocument() async {
    clearErrors();

    if (!DocumentValidator.validate(registerPageController.documentField)) {
      return;
    }

    String document = registerPageController.documentField.maskFormatter!.getUnmaskedText();

    pageLoading.value = true;

    try {
      await userRepository.getUserByDocument(document);
    } on ApiErrorWithMessageException catch (e) {
      pageLoading.value = false;
      registerPageController.documentField.errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      pageLoading.value = false;
      registerPageController.documentField.errorMessage.value = 'Falha ao validar documento';
      return;
    }
    pageLoading.value = false;

    registerPageController.userWithPassword.value.document = document;
    FocusManager.instance.primaryFocus?.unfocus();
    Get.toNamed(AppRoutes.validateUserInfo);
  }

  void clearErrors() {
    registerPageController.documentField.errorMessage.value = '';
  }

}