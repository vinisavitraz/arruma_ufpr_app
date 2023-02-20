import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/commons/validation/password_validator.dart';
import 'package:arruma_ufpr_app/src/user/dto/request/update_user_password.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/confirm_dialog_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_password_text_field.dart';
import 'package:get/get.dart';

class UpdatePasswordPageController extends GetxController {

  final UserRepository userRepository;
  final AuthenticatedController authenticatedController = Get.find();

  final RxString feedback = ''.obs;
  final RxString feedbackError = ''.obs;

  UpdatePasswordPageController({
    required this.userRepository,
  });

  final MyPasswordTextField newPasswordField = MyPasswordTextField(maxLength: 12);
  final MyPasswordTextField repeatedNewPasswordField = MyPasswordTextField(maxLength: 12);
  final RxString pageMessage = ''.obs;

  Future<void> changePassword() async {
    clearErrorMessages();

    if (!PasswordValidator.validatePasswords(newPasswordField, repeatedNewPasswordField)) {
      return;
    }

    try {
      await userRepository.updateUserPassword(
          UpdateUserPasswordRequestDTO(
            userId: authenticatedController.authenticatedUser.value.id!,
            password: newPasswordField.getValue(),
            confirmPassword: repeatedNewPasswordField.getValue(),
          )
      );
    } on ApiErrorWithMessageException catch (e) {
      pageMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      pageMessage.value = 'Erro desconhecido durante alteração de senha. Tente novamente.';
      return;
    }

    Get.defaultDialog(
      title: 'Sucesso',
      backgroundColor: AppColors.white,
      content: const ConfirmDialogComponent(text: 'Senha alterada com sucesso!'),
    ).then((value) => {Get.back()});
  }

  void clearErrorMessages() {
    pageMessage.value = '';
    newPasswordField.errorMessage.value = '';
    repeatedNewPasswordField.errorMessage.value = '';
  }

  @override
  void dispose() {
    newPasswordField.editController.dispose();
    repeatedNewPasswordField.editController.dispose();
    super.dispose();
  }

}