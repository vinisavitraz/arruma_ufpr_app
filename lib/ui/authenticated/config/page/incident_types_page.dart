import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/incident_types_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/profile_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../widgets/incident_type/incident_type_card_component.dart';

class IncidentTypesPage extends GetView<IncidentTypesPageController> {

  const IncidentTypesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _createIncidentTypeFloatingButton(context),
        backgroundColor: AppColors.lightGrey,
        appBar: const MyAppBar(
          title: 'Tipos',
        ),
        body: Obx(() => controller.pageLoading.value ?
          const Center(
            child: CircularProgressIndicator(),
          ) :
        Column(
          children: [
            _inputSearch(),
            Visibility(
              visible: controller.listIncidentTypes.isNotEmpty,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                      itemCount: controller.listIncidentTypes.length,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return IncidentTypeCardComponent(
                          incidentType: controller.listIncidentTypes[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: controller.listIncidentTypes.isEmpty,
              child: const Expanded(
                child: Center(
                  child: Text('Nenhum tipo de incidente encontrado',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }

  Widget _inputSearch() {
    return Obx(() => Row(
      children: [
        Expanded(
          child: CustomTextInput(
            paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textHint: 'Pesquisar',
            onChanged: (value) {
              controller.setField(controller.searchField, value);
            },
            autoFocus: false,
            textColor: AppColors.black,
            textHintColor: AppColors.primaryAccentColor,
            errorMessage: controller.searchField.errorMessage.value,
            inputEditController: controller.searchField.editController,
            keyboardType: TextInputType.name,
          ),
        ),
        Visibility(
          visible: controller.searching.value,
          child: Align(
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
        ),
      ],
    ));
  }

  Widget _createIncidentTypeFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        heroTag: "create_incident_type",
        onPressed: controller.openCreateIncidentTypePage,
        child: const AppIcon(
          AppIcons.plus,
          size: Size(40, 40),
          color: AppColors.white,
        ),
      ),
    );
  }



}