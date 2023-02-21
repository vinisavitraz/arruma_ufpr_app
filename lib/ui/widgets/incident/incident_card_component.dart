import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incidents_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/incident/mapper/incident_mapper.dart';

class IncidentCardComponent extends StatelessWidget {

  final Incident incident;
  final IncidentsPageController incidentsPageController = Get.find();

  IncidentCardComponent({
    Key? key,
    required this.incident,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        incidentsPageController.authenticatedController.showIncidentDetail(incident)
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  width: 1,
                  color: AppColors.lightGrey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.lightGrey,
                      spreadRadius: 1,
                      blurRadius: 3
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      color: AppColors.primaryAccentColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('#${incident.id} | ${incident.userName!}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: IncidentMapper.mapStatusColor(incident.status!),
                          border: Border.all(
                            width: 5,
                            color: IncidentMapper.mapStatusColor(incident.status!),
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          IncidentMapper.mapStatusName(incident.status!),
                          style: TextStyle(
                            color: IncidentMapper.mapStatusTextColor(incident.status!),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(incident.title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(incident.description!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        const AppIcon(
                          AppIcons.incidentType,
                          size: Size(14, 14),
                          color: AppColors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(incident.incidentTypeName!,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        const AppIcon(
                          AppIcons.location,
                          size: Size(14, 14),
                          color: AppColors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(incident.locationName!,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        const AppIcon(
                          AppIcons.item,
                          size: Size(14, 14),
                          color: AppColors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(incident.itemName!,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const DividerComponent(),
                  Container(
                    color: AppColors.primaryColor,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Detalhes',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
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