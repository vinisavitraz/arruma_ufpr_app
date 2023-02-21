import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_type_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/incident_types_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

import '../../../../src/incident/dto/request/create_incident_type_request_dto.dart';
import '../../../../src/incident/dto/request/update_incident_type_request_dto.dart';

class CreateIncidentTypePageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final IncidentTypesPageController incidentTypesPageController = Get.find();

  final RxString labelDescription = 'Criar tipo de incidente'.obs;
  final RxBool create = true.obs;

  final RxString errorMessage = ''.obs;
  final MyTextField nameField = MyTextField();
  final MyTextField descriptionField = MyTextField();

  final RxBool pageLoading = true.obs;
  final Rx<IncidentType> incidentType = IncidentType().obs;

  final IncidentTypeRepository incidentTypeRepository;

  CreateIncidentTypePageController({
    required this.incidentTypeRepository,
  });

  @override
  void onReady() async {
    super.onReady();


    if (Get.arguments == null || Get.arguments['incidentType'] == null) {
      return;
    }

    labelDescription.value = 'Editar tipo de incidente';
    create.value = false;

    incidentType.value = Get.arguments['incidentType'];

    await getIncidentType();
  }

  Future<void> getIncidentType() async {
    IncidentTypeResponseDTO incidentTypeResponseDTO;

    try {
      incidentTypeResponseDTO = await incidentTypeRepository.getIncidentType(incidentType.value.id!);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao buscar o tipo de incidente, por favor tente novamente.');
      return;
    }

    incidentType.value = incidentTypeResponseDTO.entity;
    incidentType.refresh();

    nameField.setValue(incidentType.value.name!);
    descriptionField.setValue(incidentType.value.description!);
  }

  Future<void> save() async {
    if (nameField.getValue().isEmpty) {
      nameField.errorMessage.value = 'Informe o nome';
      return;
    }
    if (descriptionField.getValue().isEmpty) {
      descriptionField.errorMessage.value = 'Informe a descrição';
      return;
    }

    if (create.value) {
      try {
        await incidentTypeRepository.createIncidentType(
            CreateIncidentTypeRequestDTO(
              name: nameField.getValue(),
              description: descriptionField.getValue(),
            ),
        );
      } on ApiErrorWithMessageException catch (e) {
        errorMessage.value = e.errorMessage;
        return;
      } on Exception catch (e) {
        CustomSnackBar.showErrorSnackBar('Encontramos um problema ao criar o tipo de incidente, por favor tente novamente.');
        return;
      }

      await incidentTypesPageController.getIncidentTypes();
      Get.back();
      return;
    }

    try {
      await incidentTypeRepository.updateIncidentType(
        UpdateIncidentTypeRequestDTO(
          id: incidentType.value.id!,
          name: nameField.getValue(),
          description: descriptionField.getValue(),
        ),
      );
    } on ApiErrorWithMessageException catch (e) {
      errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao atualizar o tipo de incidente, por favor tente novamente.');
      return;
    }

    await incidentTypesPageController.getIncidentTypes();
    Get.back();
  }

}