import 'package:arruma_ufpr_app/src/incident/entity/incident_interaction.dart';
import 'package:flutter/material.dart';
import '../../../app/app_colors.dart';

class IncidentInteractionItemComponent extends StatelessWidget {

  final IncidentInteraction incidentInteraction;

  const IncidentInteractionItemComponent({
    Key? key,
    required this.incidentInteraction
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: incidentInteraction.origin == 0 ? AppColors.primaryAccentColor : AppColors.primaryColor,
                    border: Border.all(
                      width: 5,
                      color: incidentInteraction.origin == 0 ? AppColors.primaryAccentColor : AppColors.primaryColor,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    incidentInteraction.userName!,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                incidentInteraction.description!,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
            // Text(
            //   PriceStringFormatter.format(order.price.toStringAsFixed(2)),
            //   style: TextStyle(
            //     color: AppColors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 12,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}