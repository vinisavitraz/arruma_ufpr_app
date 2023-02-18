import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:flutter/material.dart';

class IncidentCardComponent extends StatelessWidget {
  final Incident incident;

  IncidentCardComponent({
    Key? key,
    required this.incident,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        //controller.showShoppingDetail(order)
      },
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: Text(DateFormatter.formatStringToDDMMYYHHMM(order.endDate),
          //       style: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16,
          //         color: AppColors.primaryColor,
          //       ),
          //     ),
          //   ),
          // ),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(80),
                    //   child: CustomNetworkImage(
                    //     imageUrl: order.marketImagePath.isNotEmpty ? order.marketImagePath : '',
                    //     fit: BoxFit.fill,
                    //     height: MediaQuery.of(context).size.height * 0.05,
                    //     width: MediaQuery.of(context).size.width * 0.12,
                    //     imageBackupPath: AppImages.mib01Picture,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(incident.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20),
                //   child: Text('Compra #${order.id}',
                //     style: const TextStyle(
                //       color: AppColors.black,
                //       fontSize: 14,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       AppIcon(
                //         AppIcons.done,
                //         size: const Size(14, 14),
                //         color: controller.mapStatusToColor(order.status),
                //       ),
                //       Text(controller.mapStatus(order.status),
                //         style: const TextStyle(
                //           color: AppColors.black,
                //           fontSize: 14,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       const AppIcon(
                //         AppIcons.money,
                //         size: Size(14, 14),
                //         color: AppColors.black,
                //       ),
                //       Text(PriceStringFormatter.format(order.totalPrice.toStringAsFixed(2)),
                //         style: const TextStyle(
                //           color: AppColors.black,
                //           fontSize: 14,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
                // const DividerComponent(),
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text('Detalhes',
                    style: TextStyle(
                      color: AppColors.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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