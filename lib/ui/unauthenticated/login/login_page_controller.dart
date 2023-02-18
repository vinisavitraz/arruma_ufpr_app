import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/services/remote/http_client/http_client_exceptions.dart';
import 'package:arruma_ufpr_app/src/auth/dto/request/auth_user_request_dto.dart';
import 'package:arruma_ufpr_app/src/auth/dto/response/auth_response_dto.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_password_text_field.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

import '../../../src/commons/mapper/exception_message_mapper.dart';

class LoginPageController extends GetxController {

  final AuthRepository authRepository;

  LoginPageController({required this.authRepository});

  final MyTextField emailField = MyTextField();
  final MyPasswordTextField passwordField = MyPasswordTextField();

  Future<void> authUser() async {
    //Get.offNamed(AppRoutes.authenticatedBase);
    if (emailField.getValue().isEmpty) {
      emailField.errorMessage.value = 'Informe seu email';
      return;
    }
    if (passwordField.getValue().isEmpty) {
      passwordField.errorMessage.value = 'Informe sua senha';
      return;
    }

    AuthResponseDTO authResponseDTO;

    try {
      authResponseDTO = await authRepository.authUser(
          AuthUserRequestDTO(
              username: emailField.getValue(),
              password: passwordField.getValue()
          ));
    } on NotFoundException catch (e) {
      emailField.errorMessage.value = 'Email não encontrado!';
      return;
    } on ForbiddenException catch (e) {
      passwordField.errorMessage.value = 'Senha incorreta!';
      return;
    } on ApiErrorWithMessageException catch (e) {

      passwordField.errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      print(e);
      // CustomSnackBar.showErrorSnackBar('Erro durante autenticação do usuário. Tente novamente.');
      return;
    }

    if (authResponseDTO.status == 'AUTHENTICATED') {
      //authRepository.saveUserToken(authResponseDTO);
      Get.offNamed(AppRoutes.authenticatedBase);
      return;
    }

    if (authResponseDTO.status == 'ERROR') {
      passwordField.errorMessage.value = ExceptionMessageMapper.mapByErrorCode(authResponseDTO.code);
      return;
    }
  }

  void navigateToRegister() {
    //Get.toNamed(AppRoutes.REGISTER);
  }

  void resetPassword() {
    //Get.offNamed(AppRoutes.REQUEST_RESET_PASSWORD);
  }

  @override
  void dispose() {
    // emailField.editController.dispose();
    // passwordField.editController.dispose();
    // super.dispose();
  }

}