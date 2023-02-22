import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/auth/dto/request/auth_user_request_dto.dart';
import 'package:arruma_ufpr_app/src/auth/dto/response/auth_response_dto.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/commons/validation/password_validator.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/register/controller/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordValidationPageController extends GetxController {

  final RegisterPageController registerPageController = Get.find();
  final AuthRepository authRepository;
  final UserRepository userRepository;

  final RxBool pageLoading = false.obs;
  final RxString errorMessage = ''.obs;

  PasswordValidationPageController({
    required this.authRepository,
    required this.userRepository
  });

  Future<void> validatePasswords() async {
    clearErrors();
    FocusManager.instance.primaryFocus?.unfocus();

    if (!PasswordValidator.validatePasswords(registerPageController.passwordTextField, registerPageController.confirmPasswordTextField)) {
      return;
    }

    registerPageController.userWithPassword.value.password = registerPageController.passwordTextField.getValue();
    registerPageController.userWithPassword.value.confirmPassword = registerPageController.confirmPasswordTextField.getValue();

    await createUser();
  }

  void clearErrors() {
    registerPageController.passwordTextField.errorMessage.value = '';
    registerPageController.confirmPasswordTextField.errorMessage.value = '';
  }

  Future<void> createUser() async {
    registerPageController.userWithPassword.value.role = 1;

    pageLoading.value = true;

    try {
      await userRepository.registerUser(registerPageController.userWithPassword.value);
    } on ApiErrorWithMessageException catch (e) {
      pageLoading.value = false;
      errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      pageLoading.value = false;
      errorMessage.value = 'Erro durante criação do usuário. Tente novamente.';
      return;
    }

    await authUser();
  }

  Future<void> authUser() async {
    AuthResponseDTO authResponseDTO;

    try {
      authResponseDTO = await authRepository.authUser(
          AuthUserRequestDTO(
            username: registerPageController.emailField.getValue(),
            password: registerPageController.passwordTextField.getValue(),
          )
      );
    } on Exception catch (e) {
      pageLoading.value = false;
      errorMessage.value = 'Erro durante autenticação do usuário. Tente novamente.';
      return;
    }

    pageLoading.value = false;

    await authRepository.saveUserToken(authResponseDTO);
    Get.offAllNamed(AppRoutes.authenticatedBase);
  }

}