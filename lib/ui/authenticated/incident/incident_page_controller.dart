import 'package:arruma_ufpr_app/src/incident/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_interaction_repository.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class IncidentPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();

  final IncidentRepository incidentRepository;
  final IncidentInteractionRepository incidentInteractionRepository;


  IncidentPageController({
    required this.incidentRepository,
    required this.incidentInteractionRepository,
  });

  final RxBool pageLoading = true.obs;

  // final RxString marketName = "".obs;
  // final RxString marketImagePath = "".obs;
  // final RxString shopInfo = "".obs;
  // final RxDouble shopTotalPrice = 0.0.obs;
  // final RxInt shopTotalProducts = 0.obs;

  late Rx<Incident> incident = Incident().obs;

  @override
  void onReady() async {
    super.onReady();
    print(pageLoading.value);
    if (Get.arguments['incident'] == null) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao recuperar informações desse incidente, por favor tente novamente.');
      Get.back();
      return;
    }

    incident.value = Get.arguments['incident'];
    pageLoading.value = false;
  }

  Future<void> assignIncident() async {
    StatusResponseDTO statusResponseDTO;

    try {
      statusResponseDTO = await this.incidentRepository.assignIncidentToAdmin(incident.value.id!);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao atender o incidente, por favor tente novamente.');
      return;
    }

    incident.value.status = 'pendente';
  }

  Future<void> closeIncident() async {
    StatusResponseDTO statusResponseDTO;

    try {
      statusResponseDTO = await this.incidentRepository.closeIncident(incident.value.id!);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao fechar o incidente, por favor tente novamente.');
      return;
    }

    incident.value.status = 'fechado';
  }

}