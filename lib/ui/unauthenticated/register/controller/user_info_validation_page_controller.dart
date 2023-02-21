import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/commons/validation/name_validator.dart';
import 'package:arruma_ufpr_app/src/commons/validation/phone_number_validator.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoValidationPageController extends GetxController {

  final RegisterPageController registerPageController = Get.find();

  final UserRepository userRepository;
  final AuthRepository authRepository;
  final RxString errorMessage = ''.obs;

  UserInfoValidationPageController({
    required this.userRepository,
    required this.authRepository,
  });

  Future<void> validateUserInfo() async {
    clearErrors();
    FocusManager.instance.primaryFocus?.unfocus();

    if (!NameValidator.validate(registerPageController.nameField)) {
      return;
    }

    if (!PhoneNumberValidator.validate(registerPageController.phoneNumberField)) {
      return;
    }

    registerPageController.userWithPassword.value.name = registerPageController.nameField.getValue();
    registerPageController.userWithPassword.value.phone = registerPageController.phoneNumberField.maskFormatter!.getUnmaskedText();
    registerPageController.userWithPassword.value.address = registerPageController.addressField.getValue();

    Get.toNamed(AppRoutes.validatePassword);
  }

  void clearErrors() {
    registerPageController.nameField.errorMessage.value = '';
    registerPageController.phoneNumberField.errorMessage.value = '';
    registerPageController.addressField.errorMessage.value = '';
  }

}