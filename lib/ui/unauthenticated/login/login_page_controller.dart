import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/auth/dto/request/auth_user_request_dto.dart';
import 'package:arruma_ufpr_app/src/auth/dto/response/auth_response_dto.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/services/remote/http_client/http_client_exceptions.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_password_text_field.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

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
      //await authRepository.test();
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
      CustomSnackBar.showErrorSnackBar('Erro durante autenticação do usuário. Tente novamente.');
      return;
    }

    await authRepository.saveUserToken(authResponseDTO);
    Get.offNamed(AppRoutes.authenticatedBase);
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