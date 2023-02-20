import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/commons/validation/email_validator.dart';
import 'package:arruma_ufpr_app/src/services/remote/http_client/http_client_exceptions.dart';
import 'package:arruma_ufpr_app/src/user/dto/request/requet_reset_password_request_dto.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestResetPasswordPageController extends GetxController {

  final MyTextField emailField = MyTextField(maxLength: 50);
  final RxString feedback = ''.obs;

  final UserRepository userRepository;

  RequestResetPasswordPageController({
    required this.userRepository,
  });

  Future<void> sendEmailResetPassword() async {
    emailField.errorMessage.value = '';

    if (!EmailValidator.validate(emailField)) {
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    try {
      await userRepository.requestResetUserPassword(
          RequestResetPasswordRequestDTO(
            email: emailField.getValue(),
        )
      );
    } on ApiErrorWithMessageException catch (e) {
      emailField.errorMessage.value = e.errorMessage;
      return;
    } on NotFoundException catch (e) {
      emailField.errorMessage.value = 'Usuário não encontrado';
      return;
    } on Exception catch (e) {
      emailField.errorMessage.value = 'Falha ao validar email';
      return;
    }

    feedback.value = 'Enviamos um link no seu email para continuar o processo de redefinição de senha!';
  }

  void backToLoginPage() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void dispose() {
    emailField.editController.dispose();
    super.dispose();
  }

}