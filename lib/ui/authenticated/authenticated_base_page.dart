import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/divider_component.dart';
import 'authenticated_controller.dart';

class AuthenticatedBasePage extends GetView<AuthenticatedController> {

  const AuthenticatedBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => controller.pageLoading.value ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Obx(() => IndexedStack(
                  index: controller.tabIndex.value,
                  children: controller.activePages,
                ),)
            ),
            Obx(() => _bottomNavigator(),),
          ],
        )
        ),
      ),
    );
  }

  Widget _bottomNavigator() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          DividerComponent(),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: controller.bottomNavigatorItems
                  .map((e) => e.copyWith(
                isActive: controller.bottomNavigatorItems.indexOf(e) == controller.tabIndex.value,
                onTap: () => controller.selectNewPageFromTab(e),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

}