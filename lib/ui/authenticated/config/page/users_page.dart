import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/incident_types_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/profile_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/users_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/user/user_card_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../widgets/incident_type/incident_type_card_component.dart';

class UsersPage extends GetView<UsersPageController> {

  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _createUserFloatingButton(context),
        backgroundColor: AppColors.white,
        appBar: const MyAppBar(
          title: 'Usuários',
        ),
        body: Column(
          children: [
            Obx(() => Visibility(
              visible: controller.listUsers.isNotEmpty,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: DividerComponent(),
                    ),
                    itemCount: controller.listUsers.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return UserCardComponent(
                        user: controller.listUsers[index],
                        //paymentTypeIcon: controller.mapPaymentTypeToIcon(controller.shoppingsList[index]),
                      );
                    },
                  ),
                ),
              ),
            )),
            Obx(() => Visibility(
              visible: controller.listUsers.isEmpty,
              child: const Expanded(
                child: Center(
                  child: Text('Nenhum usuário encontrado',
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

  Widget _createUserFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        heroTag: "create_user",
        onPressed: controller.openCreateUserPage,
        child: const AppIcon(
          AppIcons.plus,
          size: Size(40, 40),
          color: AppColors.white,
        ),
      ),
    );
  }



}