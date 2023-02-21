import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/incident/incident_card_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'incidents_page_controller.dart';

class IncidentsPage extends GetView<IncidentsPageController> {

  const IncidentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryAccentColor,
        bottom: TabBar(
          controller: controller.tabController,
          isScrollable: true,
          tabs: [
            Tab(text: 'Aberto'),
            Tab(text: 'Atendimento'),
            Tab(text: 'Finalizado'),
            Tab(text: 'Geral'),
          ],
        ),
        title: Text('Incidentes'),
      ),
      backgroundColor: AppColors.lightGrey,
      body: TabBarView(
        controller: controller.tabController,
        children: [
          buildIncidentList('Aberto', controller.authenticatedController.listOpenIncidents),
          buildIncidentList('Atendimento', controller.authenticatedController.listPendingIncidents),
          buildIncidentList('Finalizado', controller.authenticatedController.listClosedIncidents),
          buildIncidentList('Geral', controller.authenticatedController.listAllIncidents),
        ],
      ),
    );
  }

  Widget buildIncidentList(String status, RxList listByStatus) {
    return Column(
      children: [
        Obx(() => Visibility(
          visible: listByStatus.isNotEmpty,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.authenticatedController.refreshIncidentsList();
                  return await Future.value();
                },
                child: ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: DividerComponent(),
                  ),
                  itemCount: listByStatus.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return IncidentCardComponent(
                      incident: listByStatus[index],
                      //paymentTypeIcon: controller.mapPaymentTypeToIcon(controller.shoppingsList[index]),
                    );
                  },
                ),
              ),
            ),
          ),
        )),
        Obx(() => Visibility(
          visible: listByStatus.isEmpty,
          child: const Expanded(
            child: Center(
              child: Text('Nenhum incidente encontrado',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryAccentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }

}