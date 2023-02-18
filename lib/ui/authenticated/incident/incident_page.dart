import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incident_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentPage extends GetView<IncidentPageController> {

  const IncidentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Detalhes do incidente',
      ),
      backgroundColor: AppColors.white,
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
                  // HeaderMarketComponent(
                  //     name: controller.marketName.value,
                  //     imagePath: controller.marketImagePath.value
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                    child: Text(controller.incident.value.title!,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: AppColors.lighterGrey,
                  //       border: Border.all(
                  //         width: 1,
                  //         color: AppColors.lighterGrey,
                  //         style: BorderStyle.solid,
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(5)),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: AppColors.lightGrey,
                  //         ),
                  //       ],
                  //     ),
                  //     //padding: EdgeInsets.all(25),
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height * 0.06,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //         Text(controller.saleConfirmed.value ? 'Compra confirmada' : 'Compra cancelada',
                  //           style: TextStyle(
                  //             fontSize: 14,
                  //             color: controller.saleConfirmed.value ? AppColors.green : AppColors.red,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(10),
                  //           child: AppIcon(
                  //             controller.saleConfirmed.value ? AppIcons.confirmed : AppIcons.canceled,
                  //             size: const Size(20, 20),
                  //             color: controller.saleConfirmed.value ? AppColors.green : AppColors.red,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 20),
                  //   child: Wrap(
                  //     children: [
                  //       ListView.separated(
                  //         shrinkWrap: true,
                  //         separatorBuilder: (context, index) => Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 15),
                  //           child: Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 10),
                  //             child: DividerComponent(),
                  //           ),
                  //         ),
                  //         itemCount: controller.listOrderProducts.length,
                  //         scrollDirection: Axis.vertical,
                  //         physics: BouncingScrollPhysics(),
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return ShopHistoryProductItemComponent(
                  //             order: controller.listOrderProducts[index],
                  //           );
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DividerComponent(),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(20),
                  //   child: ShopSummaryComponent(
                  //     totalProducts: controller.shopTotalProducts.value.toString(),
                  //     totalShopPrice: controller.shopTotalPrice.value,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(20),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(controller.paymentTypeUsed.value,
                  //         style: TextStyle(
                  //           color: AppColors.black,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //       Text(controller.paymentInfo.value,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: AppColors.black,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DividerComponent(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: CustomButton(
                        text: 'Solicitar ajuda',
                        onPressed: () => {},
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