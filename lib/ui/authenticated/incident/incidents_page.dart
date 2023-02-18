import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/widgets/incident/incident_card_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'incidents_page_controller.dart';

class IncidentsPage extends GetView<IncidentsPageController> {

  const IncidentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          bottom: TabBar(
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
          children: [
            buildIncidentList('Aberto'),
            buildIncidentList('Atendimento'),
            buildIncidentList('Finalizado'),
            buildIncidentList('Geral'),
          ],
        ),
      ),
    );
  }

  Widget buildIncidentList(String status) {
    return Column(
      children: [
        Obx(() => Visibility(
          visible: controller.listIncidents.isNotEmpty,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                itemCount: controller.listIncidents.length,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return IncidentCardComponent(
                    incident: controller.listIncidents[index],
                    //paymentTypeIcon: controller.mapPaymentTypeToIcon(controller.shoppingsList[index]),
                  );
                },
              ),
            ),
          ),
        )),
        Obx(() => Visibility(
          visible: controller.listIncidents.isEmpty,
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