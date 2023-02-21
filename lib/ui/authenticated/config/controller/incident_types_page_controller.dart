import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class IncidentTypesPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final IncidentTypeRepository incidentTypeRepository;
  final RxList<IncidentType> listIncidentTypes = <IncidentType>[].obs;

  final RxBool pageLoading = true.obs;

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

}