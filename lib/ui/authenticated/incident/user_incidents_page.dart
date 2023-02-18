import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/ui/widgets/incident/incident_card_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'user_incidents_page_controller.dart';

class UserIncidentsPage extends GetView<UserIncidentsPageController> {

  const UserIncidentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _createIncidentFloatingButton(context),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
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
        title: Text('ArrumaUFPR'),
      ),
      backgroundColor: AppColors.white,
      body: TabBarView(
        controller: controller.tabController,
        children: [
          buildIncidentList('Aberto', controller.authenticatedController.listUserOpenIncidents),
          buildIncidentList('Atendimento', controller.authenticatedController.listUserPendingIncidents),
          buildIncidentList('Finalizado', controller.authenticatedController.listUserClosedIncidents),
          buildIncidentList('Geral', controller.authenticatedController.listUserAllIncidents),
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
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
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

  Widget _createIncidentFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        heroTag: "create_incident",
        onPressed: controller.openCreateIncidentPage,
        child: const AppIcon(
          AppIcons.plus,
          size: Size(40, 40),
          color: AppColors.white,
        ),
      ),
    );
  }


}