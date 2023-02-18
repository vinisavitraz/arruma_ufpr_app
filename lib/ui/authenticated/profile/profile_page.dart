import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/widgets/profile/list_items_profile_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'profile_page_controller.dart';

class ProfilePage extends GetView<ProfilePageController> {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: ListItemsProfileComponent(
                    onTap: controller.goToConfigPage,
                    userName: controller.authenticatedController.userName,
                    listItems: controller.listItems,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }


}