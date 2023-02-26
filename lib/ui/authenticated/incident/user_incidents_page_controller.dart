import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserIncidentsPageController extends GetxController with GetSingleTickerProviderStateMixin {

  final AuthenticatedController authenticatedController = Get.find();
  late final tabController = TabController(vsync: this, length: 4);
  final RxString activeTab = 'aberto'.obs;

  final RxBool searching = false.obs;
  final RxString searchingTab = ''.obs;
  final MyTextField search = MyTextField();
  final RxList<Incident> originalListSearchIncidents = <Incident>[].obs;
  final RxList<Incident> filteredListSearchIncidents = <Incident>[].obs;

  @override
  void onReady() async {
    super.onReady();

    tabController.addListener((){
      switch(tabController.index) {
        case 0:
          activeTab.value = 'atendimento';
          break;
        case 1:
          activeTab.value = 'aberto';
          break;
        case 2:
          activeTab.value = 'finalizado';
          break;
        case 3:
          activeTab.value = 'geral';
          break;
      }

      searching.value = activeTab.value == searchingTab.value;
    });

    activeTab.listen((tab) {
      authenticatedController.setActiveTab(tab);
    });
  }

  void openCreateIncidentPage() {
    Get.toNamed(AppRoutes.createIncident);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> onCancelSearch() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (searching.value) {
      search.setValue('');
      searching.value = false;
      searchingTab.value = '';
      List<Incident> listIncidents = getListByActiveTab();
      listIncidents.assignAll(originalListSearchIncidents);
      return;
    }
  }

  Future<void> searchIncidents() async {
    if (!searching.value) {
      search.setValue('');
      searchingTab.value = activeTab.value;
      searching.value = true;
      List<Incident> listIncidents = getListByActiveTab();
      originalListSearchIncidents.assignAll(listIncidents);
      return;
    }
  }

  void setField(MyTextField field, String value) {
    bool filterMore = true;

    if (field.getValue().length > value.length) {
      filterMore = false;
    }

    field.errorMessage.value = null;
    field.setValue(value);

    filterIncidentsList(value, filterMore);
  }

  Future<void> filterIncidentsList(String value, bool filterMore) async {
    List<Incident> listIncidents = getListByActiveTab();

    if (value.isEmpty) {
      listIncidents.assignAll(originalListSearchIncidents);
      return;
    }

    if (filterMore) {
      filteredListSearchIncidents.assignAll(listIncidents.where((i) => matchIncident(i, value)));
    } else {
      listIncidents.assignAll(originalListSearchIncidents);
      filteredListSearchIncidents.assignAll(listIncidents.where((i) => matchIncident(i, value)));
    }

    listIncidents.assignAll(filteredListSearchIncidents);
  }

  RxList<Incident> getListByActiveTab() {
    switch(activeTab.value) {
      case 'aberto':
        return authenticatedController.listUserOpenIncidents;
      case 'atendimento':
        return authenticatedController.listUserPendingIncidents;
      case 'finalizado':
        return authenticatedController.listUserClosedIncidents;
      case 'geral':
        return authenticatedController.listUserAllIncidents;
    }

    return authenticatedController.listUserAllIncidents;
  }

  bool matchIncident(Incident incident, String value) {
    return incident.id!.toString().toUpperCase().contains(value.toUpperCase())
      || incident.title!.toUpperCase().contains(value.toUpperCase())
      || incident.description!.toUpperCase().contains(value.toUpperCase())
      || incident.incidentTypeId!.toString().toUpperCase().contains(value.toUpperCase())
      || incident.incidentTypeName!.toUpperCase().contains(value.toUpperCase())
      || incident.locationId!.toString().toUpperCase().contains(value.toUpperCase())
      || incident.locationName!.toUpperCase().contains(value.toUpperCase())
      || incident.itemId!.toString().toUpperCase().contains(value.toUpperCase())
      || incident.itemName!.toUpperCase().contains(value.toUpperCase());
  }

}