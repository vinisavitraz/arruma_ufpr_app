import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/incident_types_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/locations_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/profile_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/location/location_card_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../widgets/incident_type/incident_type_card_component.dart';

class LocationsPage extends GetView<LocationsPageController> {

  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _createLocationsFloatingButton(context),
        backgroundColor: AppColors.white,
        appBar: const MyAppBar(
          title: 'Locais',
        ),
        body: Column(
          children: [
            Obx(() => Visibility(
              visible: controller.listLocations.isNotEmpty,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: DividerComponent(),
                    ),
                    itemCount: controller.listLocations.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return LocationCardComponent(
                        location: controller.listLocations[index],
                        //paymentTypeIcon: controller.mapPaymentTypeToIcon(controller.shoppingsList[index]),
                      );
                    },
                  ),
                ),
              ),
            )),
            Obx(() => Visibility(
              visible: controller.listLocations.isEmpty,
              child: const Expanded(
                child: Center(
                  child: Text('Nenhum local encontrado',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _createLocationsFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        heroTag: "create_incident_type",
        onPressed: controller.openCreateLocationPage,
        child: const AppIcon(
          AppIcons.plus,
          size: Size(40, 40),
          color: AppColors.white,
        ),
      ),
    );
  }



}