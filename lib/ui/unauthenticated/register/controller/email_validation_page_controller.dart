import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/commons/validation/email_validator.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailValidationPageController extends GetxController {

  final RegisterPageController registerPageController = Get.find();
  final UserRepository userRepository;

  final RxBool pageLoading = false.obs;

  EmailValidationPageController({
    required this.userRepository,
  });


  void validateEmail() async {
    clearErrors();

    if (!EmailValidator.validate(registerPageController.emailField)) {
      return;
    }

    pageLoading.value = true;

    try {
      await userRepository.getUserByEmail(registerPageController.emailField.getValue());
    } on ApiErrorWithMessageException catch (e) {
      pageLoading.value = false;
      registerPageController.emailField.errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      pageLoading.value = false;
      registerPageController.emailField.errorMessage.value = 'Falha ao validar email';
      return;
    }

    pageLoading.value = false;
    registerPageController.userWithPassword.value.email = registerPageController.emailField.getValue();
    FocusManager.instance.primaryFocus?.unfocus();
    Get.toNamed(AppRoutes.validateDocument);
  }

  void clearErrors() {
    registerPageController.emailField.errorMessage.value = '';
  }

}