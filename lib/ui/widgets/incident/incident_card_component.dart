import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/commons/date/date_formatter.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Incidentes', //DateFormatter.formatStringToDDMMYYHHMM(incident.endDate),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
                Text('Incidente #${incident.id}',
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    AppIcon(
                      AppIcons.incident,
                      size: const Size(14, 14),
                      color: incidentsPageController.mapStatusToColor(incident.status!),
                    ),
                    Text(incidentsPageController.mapStatus(incident.status!),
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
                Row(
                  children: [
                    const AppIcon(
                      AppIcons.profile,
                      size: Size(14, 14),
                      color: AppColors.black,
                    ),
                    Text(incident.userName!,
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
                      AppIcons.profile,
                      size: Size(14, 14),
                      color: AppColors.black,
                    ),
                    Text(incident.adminName ?? '',
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
                Text('Detalhes',
                  style: TextStyle(
                    color: AppColors.primaryAccentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}