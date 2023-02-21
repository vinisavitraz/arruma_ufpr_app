import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/commons/validation/name_validator.dart';
import 'package:arruma_ufpr_app/src/commons/validation/phone_number_validator.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/location_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/src/ui/select_item.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/user_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/entity/user.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/locations_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/users_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../src/location/dto/request/create_location_request_dto.dart';
import '../../../../src/location/dto/request/update_location_request_dto.dart';

class CreateUserPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final UsersPageController usersPageController = Get.find();

  final RxString labelDescription = 'Criar usuário'.obs;
  final RxBool create = true.obs;

  final RxString errorMessage = ''.obs;
  final MyTextField emailField = MyTextField();
  final MyTextField nameField = MyTextField(maxLength: 100);
  final MyTextField documentField = MyTextField(maxLength: 14, mask: '###.###.###-##');
  final MyTextField phoneNumberField = MyTextField(maxLength: 16, mask: '(##) #####-####');
  final MyTextField addressField = MyTextField(maxLength: 200);
  final MyTextField roleField = MyTextField();

  final RxList<SelectItem> roleOptions = <SelectItem>[
    SelectItem(
        value: '0',
        text: 'Administrador'
    ),
    SelectItem(
        value: '1',
        text: 'Usuário'
    ),
  ].obs;

  final RxBool pageLoading = true.obs;
  final Rx<User> user = User().obs;

  final UserRepository userRepository;

  CreateUserPageController({
    required this.userRepository,
  });

  @override
  void onReady() async {
    super.onReady();


    if (Get.arguments == null || Get.arguments['user'] == null) {
      return;
    }

    labelDescription.value = 'Editar usuário';
    create.value = false;

    user.value = Get.arguments['user'];

    await getUser();
  }

  Future<void> getUser() async {
    UserResponseDTO userResponseDTO;

    try {
      userResponseDTO = await userRepository.getUser(user.value.id!);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao buscar o usuário, por favor tente novamente.');
      return;
    }

    user.value = userResponseDTO.entity;
    user.refresh();

    nameField.setValue(user.value.name!);
    emailField.setValue(user.value.email!);
    documentField.setValue(documentField.maskFormatter!.maskText(user.value.document!));
    phoneNumberField.setValue(phoneNumberField.maskFormatter!.maskText(user.value.phone!));
    addressField.setValue(user.value.address!);
    roleField.setValue(user.value.role.toString());
  }

  Future<void> save() async {
    errorMessage.value = '';
    FocusManager.instance.primaryFocus?.unfocus();

    if (!NameValidator.validate(nameField)) {
      return;
    }

    if (!PhoneNumberValidator.validate(phoneNumberField)) {
      return;
    }

    if (create.value) {
      try {
        await userRepository.createUser(
          User(
            name: nameField.getValue(),
            document: documentField.maskFormatter!.getUnmaskedText(),
            phone: phoneNumberField.maskFormatter!.getUnmaskedText(),
            address: addressField.getValue(),
            role: int.parse(roleField.getValue()),
            email: emailField.getValue(),
          ),
        );
      } on ApiErrorWithMessageException catch (e) {
        errorMessage.value = e.errorMessage;
        return;
      } on Exception catch (e) {
        CustomSnackBar.showErrorSnackBar('Encontramos um problema ao criar o usuário, por favor tente novamente.');
        return;
      }

      await usersPageController.getUsers();
      Get.back();
      return;
    }

    try {
      await userRepository.updateUser(
        User(
          id: user.value.id!,
          name: nameField.getValue(),
          document: documentField.maskFormatter!.getUnmaskedText(),
          phone: phoneNumberField.maskFormatter!.getUnmaskedText(),
          address: addressField.getValue(),
          role: int.parse(roleField.getValue()),
          email: emailField.getValue(),
        ),
      );
    } on ApiErrorWithMessageException catch (e) {
      errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao atualizar o usuário, por favor tente novamente.');
      return;
    }

    await usersPageController.getUsers();
    Get.back();
  }

}