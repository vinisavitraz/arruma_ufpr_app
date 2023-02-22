import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/my_text_field.dart';

class IncidentTypesPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final IncidentTypeRepository incidentTypeRepository;
  final RxList<IncidentType> listIncidentTypes = <IncidentType>[].obs;
  final RxList<IncidentType> originalListSearchIncidentTypes = <IncidentType>[].obs;
  final RxList<IncidentType> filteredListSearchIncidentTypes = <IncidentType>[].obs;

  final RxBool pageLoading = true.obs;
  final MyTextField searchField = MyTextField();
  final RxBool searching = false.obs;

  IncidentTypesPageController({
    required this.incidentTypeRepository,
  });

  @override
  void onReady() async {
    super.onReady();

    await getIncidentTypes();
  }

  Future<void> getIncidentTypes() async {
    IncidentTypesResponseDTO incidentTypesResponseDTO;

    try {
      incidentTypesResponseDTO = await incidentTypeRepository.getIncidentTypes();
    } on Exception catch (e) {
      pageLoading.value = false;
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os tipos de incidente, por favor tente novamente.');
      return;
    }
    pageLoading.value = false;

    if (incidentTypesResponseDTO.incidentTypes == null) {
      return;
    }

    listIncidentTypes.assignAll(incidentTypesResponseDTO.incidentTypes!);
  }

  Future<void> deleteIncidentType(IncidentType incidentType) async {
    StatusResponseDTO statusResponseDTO;

    try {
      statusResponseDTO = await incidentTypeRepository.deleteIncidentType(incidentType.id!);
    } on Exception catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao remover o tipo de incidente, por favor tente novamente.');
      return;
    }
    List<IncidentType> updatedList = List<IncidentType>.from(listIncidentTypes);
    updatedList.removeAt(updatedList.indexWhere((element) => element.id == incidentType.id));
    listIncidentTypes.assignAll(updatedList);

    Get.back();
  }

  void openCreateIncidentTypePage() {
    Get.toNamed(AppRoutes.createIncidentType);
  }

  void showEditIncidentTypePage(IncidentType incidentType) {
    Get.toNamed(AppRoutes.createIncidentType, arguments: {"incidentType": incidentType});
  }

  void setField(MyTextField field, String value) {
    if (!searching.value) {
      searchField.setValue('');
      searching.value = true;
      originalListSearchIncidentTypes.assignAll(listIncidentTypes);
    }

    bool filterMore = true;

    if (field.getValue().length > value.length) {
      filterMore = false;
    }

    field.errorMessage.value = null;
    field.setValue(value);

    filterIncidentTypesList(value, filterMore);
  }

  Future<void> filterIncidentTypesList(String value, bool filterMore) async {
    if (value.isEmpty) {
      listIncidentTypes.assignAll(originalListSearchIncidentTypes);
      return;
    }

    if (filterMore) {
      filteredListSearchIncidentTypes.assignAll(listIncidentTypes.where((i) => matchIncidentType(i, value)));
    } else {
      listIncidentTypes.assignAll(originalListSearchIncidentTypes);
      filteredListSearchIncidentTypes.assignAll(listIncidentTypes.where((i) => matchIncidentType(i, value)));
    }

    listIncidentTypes.assignAll(filteredListSearchIncidentTypes);
  }

  bool matchIncidentType(IncidentType incidentType, String value) {
    return incidentType.id!.toString().toUpperCase().contains(value.toUpperCase())
        || incidentType.name!.toUpperCase().contains(value.toUpperCase())
        || incidentType.description!.toUpperCase().contains(value.toUpperCase());
  }

  Future<void> onCancelSearch() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (searching.value) {
      searchField.setValue('');
      searching.value = false;
      listIncidentTypes.assignAll(originalListSearchIncidentTypes);
      return;
    }
  }

}