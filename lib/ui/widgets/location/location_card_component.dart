import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/locations_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationCardComponent extends StatelessWidget {

  final Location location;
  final LocationsPageController locationsPageController = Get.find();

  LocationCardComponent({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        locationsPageController.showEditLocationPage(location)
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
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
                            child: Text('#${location.id} | ${location.name!}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () => _confirmDeleteDialog(),
                              child: const AppIcon(
                                AppIcons.trash,
                                size: Size(15, 25),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(location.description!,
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
                  const DividerComponent(),
                  Container(
                    color: AppColors.primaryColor,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Editar',
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

  void _confirmDeleteDialog() {
    Get.defaultDialog(
      title: 'Confirmar',
      backgroundColor: AppColors.white,
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Deseja realmente remover esse registro?',
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
                    onTap: () => locationsPageController.deleteLocation(location),
                    child: const Text('Remover',
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