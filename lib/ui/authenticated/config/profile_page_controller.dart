import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/commons/validation/name_validator.dart';
import 'package:arruma_ufpr_app/src/commons/validation/phone_number_validator.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/user_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/entity/user.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {

  final UserRepository userRepository;
  final AuthenticatedController authenticatedController = Get.find();

  final RxString feedback = ''.obs;
  final RxString feedbackError = ''.obs;
  final MyTextField emailField = MyTextField();
  final MyTextField nameField = MyTextField(maxLength: 100);
  final MyTextField documentField = MyTextField(maxLength: 14, mask: '###.###.###-##');
  final MyTextField phoneNumberField = MyTextField(maxLength: 16, mask: '(##) #####-####');
  final MyTextField addressField = MyTextField(maxLength: 200);

  ProfilePageController({
    required this.userRepository,
  });

  @override
  void onReady() async {
    super.onReady();

    await fillAuthenticatedUserInfo();
  }

  Future<void> fillAuthenticatedUserInfo() async {
    User authenticatedUser = authenticatedController.authenticatedUser.value;

    nameField.setValue(authenticatedUser.name!);
    emailField.setValue(authenticatedUser.email!);
    documentField.setValue(documentField.maskFormatter!.maskText(authenticatedUser.document!));
    phoneNumberField.setValue(phoneNumberField.maskFormatter!.maskText(authenticatedUser.phone!));
    addressField.setValue(authenticatedUser.address!);
  }

  Future<void> updateUser() async {
    feedbackError.value = '';
    feedback.value = '';
    FocusManager.instance.primaryFocus?.unfocus();

    if (!NameValidator.validate(nameField)) {
      return;
    }

    if (!PhoneNumberValidator.validate(phoneNumberField)) {
      return;
    }

    User updatedUser = User(
        id: authenticatedController.authenticatedUser.value.id!,
        name: nameField.getValue(),
        document: documentField.maskFormatter!.getUnmaskedText(),
        phone: phoneNumberField.maskFormatter!.getUnmaskedText(),
        address: addressField.getValue(),
        role: authenticatedController.authenticatedUser.value.role!,
        email: emailField.getValue(),
    );

    UserResponseDTO userResponseDTO;

    try {
      userResponseDTO = await userRepository.updateUser(updatedUser);
    } on ApiErrorWithMessageException catch (e) {
      feedbackError.value = e.errorMessage;
      // Get.defaultDialog(
      //   title: 'Erro',
      //   backgroundColor: AppColors.white,
      //   content: ConfirmDialogComponent(text: e.errorMessage),
      // ).then((value) => {});
      return;
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao atualizar seus dados, por favor tente novamente.');
      return;
    }

    authenticatedController.authenticatedUser.value = userResponseDTO.entity;
    authenticatedController.authenticatedUser.refresh();

    feedback.value = 'Perfil atualizado com sucesso!';
  }

}