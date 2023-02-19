import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incidents_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Text('Incidentes', //DateFormatter.formatStringToDDMMYYHHMM(incident.endDate),
            //       style: const TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: AppColors.primaryColor,
            //       ),
            //     ),
            //   ),
            // ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('#${incident.id} | ${incident.userName!}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(incidentsPageController.mapStatus(incident.status!),
                        style: TextStyle(
                          color: incidentsPageController.mapStatusToColor(incident.status!),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
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
                  Row(
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
                  Row(
                    children: [
                      const AppIcon(
                        AppIcons.incidentType,
                        size: Size(14, 14),
                        color: AppColors.black,
                      ),
                      Text(incident.incidentTypeName!,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const AppIcon(
                        AppIcons.location,
                        size: Size(14, 14),
                        color: AppColors.black,
                      ),
                      Text(incident.locationName!,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const AppIcon(
                        AppIcons.item,
                        size: Size(14, 14),
                        color: AppColors.black,
                      ),
                      Text(incident.itemName!,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10, bottom: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       const AppIcon(
                  //         AppIcons.basket,
                  //         size: Size(14, 14),
                  //         color: AppColors.black,
                  //       ),
                  //       Text(order.totalProducts > 1 ? '${order.totalProducts} produtos' : '${order.totalProducts} produto',
                  //         style: const TextStyle(
                  //           color: AppColors.black,
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const DividerComponent(),
                  Container(
                    color: AppColors.primaryColor,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Acessar incidente',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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