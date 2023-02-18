import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserIncidentsPageController extends GetxController with GetSingleTickerProviderStateMixin {

  final AuthenticatedController authenticatedController = Get.find();
  late final tabController = TabController(vsync: this, length: 4);
  final RxString activeTab = ''.obs;

  @override
  void onReady() async {
    super.onReady();

    tabController.addListener((){
      switch(tabController.index) {
        case 0:
          activeTab.value = 'aberto';
          break;
        case 1:
          activeTab.value = 'atendimento';
          break;
        case 2:
          activeTab.value = 'finalizado';
          break;
        case 3:
          activeTab.value = 'geral';
          break;
      }
    });

    activeTab.listen((tab) {
      authenticatedController.setActiveTab(tab);
    });
  }

  String mapStatus(String status) {
    if (status == 'aberto') {
      return 'Aberto';
    }

    if (status == 'pendente') {
      return 'Em atendimento';
    }

    if (status == 'fechado') {
      return 'Finalizado';
    }

    return 'Desconhecido';
  }

  Color mapStatusToColor(String status) {
    if (status == 'aberto') {
      return Colors.yellow;
    }

    if (status == 'pendente') {
      return Colors.green;
    }

    if (status == 'fechado') {
      return AppColors.primaryColor;
    }

    return Colors.red;
  }

  void openCreateIncidentPage() {
    Get.toNamed(AppRoutes.createIncident);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

}