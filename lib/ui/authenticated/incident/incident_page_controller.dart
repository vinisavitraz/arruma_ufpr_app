import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/incident/dto/request/create_incident_interaction_request_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_interaction_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_interactions_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_interaction.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_interaction_repository.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();

  final IncidentRepository incidentRepository;
  final IncidentInteractionRepository incidentInteractionRepository;

  final RxBool showAssignIncident = false.obs;
  final RxBool showCloseIncident = false.obs;
  final RxBool showNewInteraction = false.obs;
  final RxBool showFormNewInteraction = false.obs;
  final RxBool showReopenIncident = false.obs;
  final RxBool showUserRating = false.obs;
  final MyTextField newMessage = MyTextField();
  final MyTextField newRatingMessage = MyTextField();

  final RxInt rating = 1.obs;
  final RxString starOneIcon = AppIcons.starActive.obs;
  final RxString starTwoIcon = AppIcons.star.obs;
  final RxString starThreeIcon = AppIcons.star.obs;

  final RxBool pageLoading = true.obs;
  final Rx<Incident> incident = Incident().obs;
  final RxList<IncidentInteraction> incidentInteractions = <IncidentInteraction>[].obs;

  IncidentPageController({
    required this.incidentRepository,
    required this.incidentInteractionRepository,
  });

  @override
  void onReady() async {
    super.onReady();

    if (Get.arguments['incident'] == null) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao recuperar informa????es desse incidente, por favor tente novamente.');
      Get.back();
      return;
    }

    incident.value = Get.arguments['incident'];

    showAssignIncident.value = incident.value.status == 'aberto' && authenticatedController.authenticatedUser.value.role! == 1;
    showCloseIncident.value = incident.value.status != 'fechado' && authenticatedController.authenticatedUser.value.role! == 1;
    showNewInteraction.value = incident.value.status != 'fechado';
    showReopenIncident.value = (incident.value.status == 'fechado' && authenticatedController.authenticatedUser.value.role! == 1) && (incident.value.rating != null && incident.value.rating! > 0);
    showUserRating.value = (incident.value.status == 'fechado' && authenticatedController.authenticatedUser.value.role! == 2) && (incident.value.rating == null ||  incident.value.rating == 0);

    await getIncidentInteractions();

    pageLoading.value = false;


    incident.listen((incident) {
      this.incident.value = incident;
      showAssignIncident.value = incident.status == 'aberto';
      showCloseIncident.value = incident.status != 'fechado';
      showNewInteraction.value = incident.status != 'fechado';
      showReopenIncident.value = (incident.status == 'fechado' && authenticatedController.authenticatedUser.value.role! == 1) && (incident.rating != null && incident.rating! > 0);
      showUserRating.value = (incident.status == 'fechado' && authenticatedController.authenticatedUser.value.role! == 2) && (incident.rating == null ||  incident.rating == 0);
    });
  }

  Future<void> assignIncident() async {
    StatusResponseDTO statusResponseDTO;

    try {
      statusResponseDTO = await incidentRepository.assignIncidentToAdmin(incident.value.id!);
    } on Exception catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao atender o incidente, por favor tente novamente.');
      return;
    }

    await authenticatedController.refreshIncidentsList();
    Get.back();
    incident.value.status = 'pendente';
    incident.refresh();

    await getIncidentInteractions();
  }

  Future<void> closeIncident() async {
    StatusResponseDTO statusResponseDTO;

    try {
      statusResponseDTO = await incidentRepository.closeIncident(incident.value.id!);
    } on Exception catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao fechar o incidente, por favor tente novamente.');
      return;
    }

    await authenticatedController.refreshIncidentsList();
    Get.back();

    incident.value.status = 'fechado';
    incident.refresh();

    await getIncidentInteractions();
  }

  Future<void> reopenIncident() async {
    StatusResponseDTO statusResponseDTO;

    try {
      statusResponseDTO = await incidentRepository.reopenIncident(incident.value.id!);
    } on Exception catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao reabrir o incidente, por favor tente novamente.');
      return;
    }

    await authenticatedController.refreshIncidentsList();
    Get.back();

    incident.value.status = 'pendente';
    incident.refresh();

    await getIncidentInteractions();
  }

  Future<void> getIncidentInteractions() async {
    IncidentInteractionsResponseDTO incidentInteractionsResponseDTO;

    try {
      incidentInteractionsResponseDTO = await incidentInteractionRepository.getIncidentInteractions(incident.value.id!);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao buscar as mensagens, por favor tente novamente.');
      return;
    }

    await authenticatedController.refreshIncidentsList();

    incidentInteractions.assignAll(incidentInteractionsResponseDTO.incidentInteractions!);
  }

  Future<void> addNewInteraction() async {
    if (!showUserRating.value && !showFormNewInteraction.value) {
      showFormNewInteraction.value = true;
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    IncidentInteractionResponseDTO incidentInteractionResponseDTO;

    try {
      incidentInteractionResponseDTO = await incidentInteractionRepository.createIncidentInteraction(
          CreateIncidentInteractionRequestDTO(
            userId: authenticatedController.authenticatedUser.value.id!,
            origin: authenticatedController.authenticatedUser.value.role!,
            incidentId: incident.value.id!,
            description: newMessage.getValue(),
          ),
      );
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao enviar a mensagem, por favor tente novamente.');
      return;
    }

    newMessage.setValue('');

    List<IncidentInteraction> interactions = List<IncidentInteraction>.empty(growable: true);
    interactions.addAll(incidentInteractions);
    interactions.add(incidentInteractionResponseDTO.entity);

    incidentInteractions.assignAll(interactions);
  }

  void setRatingStar(int rating) {
    this.rating.value = rating;

    if (rating > 2) {
      starThreeIcon.value = AppIcons.starActive;
      starTwoIcon.value = AppIcons.starActive;
      starOneIcon.value = AppIcons.starActive;
      return;
    }

    if (rating > 1) {
      starThreeIcon.value = AppIcons.star;
      starTwoIcon.value = AppIcons.starActive;
      starOneIcon.value = AppIcons.starActive;
      return;
    }

    if (rating > 0) {
      starThreeIcon.value = AppIcons.star;
      starTwoIcon.value = AppIcons.star;
      starOneIcon.value = AppIcons.starActive;
    }
  }

  Future<void> rateIncident() async {
    pageLoading.value = true;

    if (newRatingMessage.getValue().isNotEmpty) {
      newMessage.setValue(newRatingMessage.getValue());
      await addNewInteraction();
    }

    try {
      await incidentRepository.setIncidentRating(incident.value.id!, rating.value);
    } on Exception catch (e) {
      pageLoading.value = false;
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao enviar a mensagem, por favor tente novamente.');
      return;
    }

    showUserRating.value = false;
    await getIncidentInteractions();

    pageLoading.value = false;
  }

}