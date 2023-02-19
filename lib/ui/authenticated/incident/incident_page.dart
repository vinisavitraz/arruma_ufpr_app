import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/commons/date/date_formatter.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incident_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/incident/mapper/incident_mapper.dart';

class IncidentPage extends GetView<IncidentPageController> {

  const IncidentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Incidente #${controller.incident.value.id ?? ''}',
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
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: IncidentMapper.mapStatusColor(controller.incident.value.status!),
                        border: Border.all(
                          width: 1,
                          color: AppColors.lighterGrey,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGrey,
                          ),
                        ],
                      ),
                      //padding: EdgeInsets.all(25),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(controller.incident.value.title!,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                    child: Text(controller.incident.value.description!,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DividerComponent(),
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
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: CustomButton(
                        text: 'Atender incidente',
                        backgroundColor: AppColors.green,
                        onPressed: controller.assignIncident,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: CustomButton(
                      text: 'Fechar incidente',
                      backgroundColor: AppColors.red,
                      onPressed: controller.closeIncident,
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

}