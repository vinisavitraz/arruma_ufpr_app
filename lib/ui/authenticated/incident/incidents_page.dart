import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/incident/incident_card_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'incidents_page_controller.dart';

class IncidentsPage extends GetView<IncidentsPageController> {

  const IncidentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
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
          title: Obx(() =>
          controller.searching.value ?
          Row(
            children: [
              Expanded(
                child: CustomTextInput(
                  paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textHint: 'Pesquisar',
                  onChanged: (value) {
                    controller.setField(controller.search, value);
                  },
                  autoFocus: false,
                  textColor: AppColors.white,
                  textHintColor: AppColors.white,
                  errorMessage: controller.search.errorMessage.value,
                  inputEditController: controller.search.editController,
                  keyboardType: TextInputType.name,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: controller.onCancelSearch,
                    child: const Text('Cancelar',
                      style: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
              :
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text('Incidentes'),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: controller.searchIncidents,
                  child: AppIcon(
                    AppIcons.search,
                    size: Size(20, 20),
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          ),
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
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: DividerComponent(),
                  ),
                  itemCount: listByStatus.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return IncidentCardComponent(
                      incident: listByStatus[index],
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