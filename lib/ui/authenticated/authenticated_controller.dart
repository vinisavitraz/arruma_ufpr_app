import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/auth/entity/authenticated_user_info.dart';
import 'package:arruma_ufpr_app/src/auth/entity/token.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incidents_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:arruma_ufpr_app/src/user/entity/user.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/config_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incidents_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/user_incidents_page.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottom_navigator_item_component.dart';

class AuthenticatedController extends GetxController {

  final RxBool pageLoading = true.obs;
  final RxInt tabIndex = 0.obs;
  final Rx<User> authenticatedUser = User().obs;

  final AuthRepository authRepository;
  final UserRepository userRepository;
  final IncidentRepository incidentRepository;

  final RxList<Widget> activePages = <Widget>[].obs;
  final RxList<BottomNavigatorItemComponent> bottomNavigatorItems = <BottomNavigatorItemComponent>[].obs;
  final RxList<Incident> listOpenIncidents = <Incident>[].obs;
  final RxList<Incident> listPendingIncidents = <Incident>[].obs;
  final RxList<Incident> listClosedIncidents = <Incident>[].obs;
  final RxList<Incident> listAllIncidents = <Incident>[].obs;
  final RxList<Incident> listIncidents = <Incident>[].obs;

  final RxList<Incident> listUserOpenIncidents = <Incident>[].obs;
  final RxList<Incident> listUserPendingIncidents = <Incident>[].obs;
  final RxList<Incident> listUserClosedIncidents = <Incident>[].obs;
  final RxList<Incident> listUserAllIncidents = <Incident>[].obs;
  final RxList<Incident> listUserIncidents = <Incident>[].obs;

  AuthenticatedController({
    required this.authRepository,
    required this.userRepository,
    required this.incidentRepository,
  });

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    AuthenticatedUserInfo authenticatedUserInfo = await userRepository.getAuthenticatedUserInfo();
    authenticatedUser.value = authenticatedUserInfo.authenticatedUserInfo;

    await refreshIncidentsList();

    loadPagesAndBottomNavigatorItems(authenticatedUser.value.role == 0);

    pageLoading.value = false;
  }

  void selectNewPageFromTab(BottomNavigatorItemComponent e) {
    int newIndex = bottomNavigatorItems.indexOf(e);
    tabIndex.value = newIndex;
  }

  Future<void> refreshIncidentsList() async {
    pageLoading.value = true;
    listAllIncidents.assignAll([]);
    listOpenIncidents.assignAll([]);
    listPendingIncidents.assignAll([]);
    listClosedIncidents.assignAll([]);
    listUserOpenIncidents.assignAll([]);
    listUserPendingIncidents.assignAll([]);
    listUserClosedIncidents.assignAll([]);

    await getIncidents('aberto', listOpenIncidents);
    await getIncidents('pendente', listPendingIncidents);
    await getIncidents('fechado', listClosedIncidents);
    await getUserIncidents('aberto', listUserOpenIncidents);
    await getUserIncidents('pendente', listUserPendingIncidents);
    await getUserIncidents('fechado', listUserClosedIncidents);

    pageLoading.value = false;
  }

  Future<void> getIncidents(String status, RxList<Incident> listByStatus) async {
    IncidentsResponseDTO incidentsResponseDTO;

    try {
      incidentsResponseDTO = await incidentRepository.getIncidents(status);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os incidentes, por favor tente novamente.');
      return;
    }

    if (incidentsResponseDTO.incidents == null) {
      return;
    }

    listByStatus.assignAll(incidentsResponseDTO.incidents!);

    List<Incident> list = List<Incident>.from(listAllIncidents);
    list.addAll(incidentsResponseDTO.incidents!);
    listAllIncidents.assignAll(list);
  }

  Future<void> getUserIncidents(String status, RxList<Incident> listByStatus) async {
    IncidentsResponseDTO incidentsResponseDTO;

    try {
      incidentsResponseDTO = await incidentRepository.getUserIncidents(status);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os incidentes, por favor tente novamente.');
      return;
    }

    if (incidentsResponseDTO.incidents == null) {
      return;
    }

    listByStatus.assignAll(incidentsResponseDTO.incidents!);

    List<Incident> list = List<Incident>.from(listUserAllIncidents);
    list.addAll(incidentsResponseDTO.incidents!);
    listUserAllIncidents.assignAll(list);
  }

  Future<void> logoutUser() async {
    Token? token = await authRepository.getActiveTokenFromInternalCache();

    if (token == null) {
      Get.snackbar('Erro!', 'Token nao encontrado!');
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    try {
     await authRepository.logoutUser();
    } on Exception catch (e) {
      print(e);
    } finally {
      await authRepository.removeToken();
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void loadPagesAndBottomNavigatorItems(bool admin) {
    List<Widget> pages = List<Widget>.empty(growable: true);
    List<BottomNavigatorItemComponent> items = List<BottomNavigatorItemComponent>.empty(growable: true);

    if (admin) {
      pages.add(IncidentsPage());

      items.add(BottomNavigatorItemComponent(
        label: 'Incidentes',
        activeIcon: AppIcons.activeIncident,
        icon: AppIcons.incident,
      ));
    }

    pages.add(UserIncidentsPage());

    items.add(BottomNavigatorItemComponent(
      label: 'Meus incidentes',
      activeIcon: AppIcons.activeIncident,
      icon: AppIcons.incident,
    ));

    pages.add(ConfigPage());
    items.add(BottomNavigatorItemComponent(
      label: 'Configurações',
      activeIcon: AppIcons.activeCog,
      icon: AppIcons.cog,
    ));

    activePages.assignAll(pages);
    bottomNavigatorItems.assignAll(items);
  }


  void setActiveTab(String tab) {
    if (tab == 'aberto') {
      listIncidents.assignAll(listOpenIncidents);
    }
    if (tab == 'atendimento') {
      listIncidents.assignAll(listPendingIncidents);
    }
    if (tab == 'finalizado') {
      listIncidents.assignAll(listClosedIncidents);
    }
    if (tab == 'geral') {
      listIncidents.assignAll(listAllIncidents);
    }
  }

  void showIncidentDetail(Incident incident) {
    Get.toNamed(AppRoutes.incident, arguments: {"incident": incident});
  }

}