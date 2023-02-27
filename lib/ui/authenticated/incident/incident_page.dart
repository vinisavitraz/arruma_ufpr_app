import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/commons/date/date_formatter.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incident_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/incident/incident_interaction_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/incident/mapper/incident_mapper.dart';
import '../../widgets/custom_network_image.dart';

class IncidentPage extends GetView<IncidentPageController> {

  const IncidentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Incidente',
      ),
      backgroundColor: AppColors.lightGrey,
      body: Obx(() => controller.pageLoading.value ?
      Center(
        child: CircularProgressIndicator(),
      ) :
      Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                return await Future.value();
              },
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text('Incidente #${controller.incident.value.id!}',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: Text('Título',
                      style: TextStyle(
                        color: AppColors.primaryAccentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 5),
                    child: Text(controller.incident.value.title!,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: Text('Descrição',
                      style: TextStyle(
                        color: AppColors.primaryAccentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, bottom: 20, top: 5),
                    child: Text(controller.incident.value.description!,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomNetworkImage(
                      fileMetadataId: controller.incident.value.fileMetadataId,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DividerComponent(),
                  ),
                  Align(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: IncidentMapper.mapPriorityColor(controller.incident.value.priority!),
                              border: Border.all(
                                width: 1,
                                color: AppColors.lightGrey,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrey,
                                ),
                              ],
                            ),
                            //padding: EdgeInsets.all(25),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(IncidentMapper.mapPriorityName(controller.incident.value.priority!),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: IncidentMapper.mapPriorityTextColor(controller.incident.value.priority!),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: IncidentMapper.mapStatusColor(controller.incident.value.status!),
                              border: Border.all(
                                width: 1,
                                color: AppColors.lightGrey,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrey,
                                ),
                              ],
                            ),
                            //padding: EdgeInsets.all(25),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(IncidentMapper.mapStatusName(controller.incident.value.status!),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: IncidentMapper.mapStatusTextColor(controller.incident.value.status!),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: AppIcon(
                            AppIcons.clock,
                            size: Size(14, 14),
                            color: AppColors.black,
                          ),
                        ),
                        Text(DateFormatter.formatStringDateTimeToReadableFormat(controller.incident.value.startDate!),
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: AppIcon(
                            AppIcons.profile,
                            size: Size(14, 14),
                            color: AppColors.black,
                          ),
                        ),
                        Text(controller.incident.value.userName!,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.incident.value.adminName != null,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: AppIcon(
                              AppIcons.profile,
                              size: Size(14, 14),
                              color: AppColors.black,
                            ),
                          ),
                          Text(controller.incident.value.adminName ?? '',
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: AppIcon(
                            AppIcons.incidentType,
                            size: Size(14, 14),
                            color: AppColors.black,
                          ),
                        ),
                        Text(controller.incident.value.incidentTypeName!,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: AppIcon(
                            AppIcons.location,
                            size: Size(14, 14),
                            color: AppColors.black,
                          ),
                        ),
                        Text(controller.incident.value.locationName!,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: AppIcon(
                            AppIcons.item,
                            size: Size(14, 14),
                            color: AppColors.black,
                          ),
                        ),
                        Text(controller.incident.value.itemName!,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DividerComponent(),
                  ),
                  Visibility(
                    visible: controller.showAssignIncident.value,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: CustomButton(
                        text: 'Atender incidente',
                        backgroundColor: AppColors.primaryColor,
                        onPressed: () => _confirmAssignDialog(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.showCloseIncident.value,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: CustomButton(
                        text: 'Finalizar incidente',
                        backgroundColor: AppColors.red,
                        onPressed: () => _confirmCloseDialog(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.showReopenIncident.value,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: CustomButton(
                        text: 'Reabrir incidente',
                        backgroundColor: AppColors.primaryLightColor,
                        onPressed: () => _confirmReopenDialog(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DividerComponent(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text('Mensagens',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.incidentInteractions.isNotEmpty,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Wrap(
                        children: [
                          Obx(() => ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: DividerComponent(),
                              ),
                            ),
                            itemCount: controller.incidentInteractions.length,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return IncidentInteractionItemComponent(
                                incidentInteraction: controller.incidentInteractions[index],
                              );
                            },
                          ),),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.incidentInteractions.isEmpty,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Incidente não possui mensagens.',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryAccentColor
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.showFormNewInteraction.value,
                    child: CustomTextInput(
                      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textHint: 'Nova mensagem',
                      onChanged: controller.newMessage.setValue,
                      autoFocus: false,
                      maxLines: 2,
                      errorMessage: controller.newMessage.errorMessage.value,
                      inputEditController: controller.newMessage.editController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Visibility(
                    visible: controller.showNewInteraction.value,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: CustomButton(
                        text: 'Nova mensagem',
                        backgroundColor: AppColors.green,
                        onPressed: controller.addNewInteraction,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.showUserRating.value,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() => InkWell(
                                onTap: () => {controller.setRatingStar(1)},
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: AppIcon(
                                    controller.starOneIcon.value,
                                    size: Size(40, 40),
                                    color: AppColors.yellow,
                                  ),
                                ),
                              ),),
                              Obx(() => InkWell(
                                onTap: () => {controller.setRatingStar(2)},
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: AppIcon(
                                    controller.starTwoIcon.value,
                                    size: Size(40, 40),
                                    color: AppColors.yellow,
                                  ),
                                ),
                              ),),
                              Obx(() => InkWell(
                                onTap: () => {controller.setRatingStar(3)},
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: AppIcon(
                                    controller.starThreeIcon.value,
                                    size: Size(40, 40),
                                    color: AppColors.yellow,
                                  ),
                                ),
                              ),),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomTextInput(
                              paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              textHint: 'Avalie seu atendimento',
                              onChanged: controller.newRatingMessage.setValue,
                              autoFocus: false,
                              maxLines: 2,
                              errorMessage: controller.newRatingMessage.errorMessage.value,
                              inputEditController: controller.newRatingMessage.editController,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          CustomButton(
                            text: 'Salvar avaliação',
                            backgroundColor: AppColors.green,
                            onPressed: controller.rateIncident,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
      ),
    );
  }

  void _confirmAssignDialog() {
    Get.defaultDialog(
      title: 'Confirmar',
      backgroundColor: AppColors.white,
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Deseja realmente atender esse incidente?',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => {Get.back()},
                    child: const Text('Cancelar'),
                  ),
                  InkWell(
                    onTap: controller.assignIncident,
                    child: const Text('Atender',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmCloseDialog() {
    Get.defaultDialog(
      title: 'Confirmar',
      backgroundColor: AppColors.white,
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Deseja realmente fechar esse incidente?',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => {Get.back()},
                    child: const Text('Cancelar'),
                  ),
                  InkWell(
                    onTap: controller.closeIncident,
                    child: const Text('Fechar',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmReopenDialog() {
    Get.defaultDialog(
      title: 'Confirmar',
      backgroundColor: AppColors.white,
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Deseja realmente reabrir esse incidente?',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => {Get.back()},
                    child: const Text('Cancelar'),
                  ),
                  InkWell(
                    onTap: controller.reopenIncident,
                    child: const Text('Reabrir',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}