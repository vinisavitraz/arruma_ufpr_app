import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/incident/incident_card_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'user_incidents_page_controller.dart';

class UserIncidentsPage extends GetView<UserIncidentsPageController> {

  const UserIncidentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _createIncidentFloatingButton(context),
        appBar: AppBar(
          backgroundColor: AppColors.primaryAccentColor,
          bottom: TabBar(
            controller: controller.tabController,
            isScrollable: true,
            tabs: [
              Tab(text: 'Em atendimento'),
              Tab(text: 'Aberto'),
              Tab(text: 'Finalizado'),
              Tab(text: 'Todos'),
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
                  child: Text('Meus incidentes'),
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

            buildIncidentList(context, 'Em atendimento', controller.authenticatedController.listUserPendingIncidents),
            buildIncidentList(context, 'Aberto', controller.authenticatedController.listUserOpenIncidents),
            buildIncidentList(context, 'Finalizado', controller.authenticatedController.listUserClosedIncidents),
            buildIncidentList(context, 'Todos', controller.authenticatedController.listUserAllIncidents),
          ],
        ),
      ),
    );
  }

  Widget buildIncidentList(BuildContext context, String status, RxList listByStatus) {
    return Column(
      children: [
        Obx(() => Visibility(
          visible: listByStatus.isNotEmpty,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
          child: Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                controller.authenticatedController.refreshIncidentsList();
                return await Future.value();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  child: Center(
                    child: Text('Nenhum incidente encontrado',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryAccentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height,
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