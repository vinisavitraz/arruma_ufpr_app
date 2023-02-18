import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/src/profile/entity/item_profile.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/profile/item_profile_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsProfileComponent extends StatelessWidget {

  final RxString userName;
  final List<ItemProfile> listItems;
  final Function(int) onTap;

  const ListItemsProfileComponent({
    Key? key,
    required this.userName,
    required this.listItems,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child: Align(
            alignment: Alignment.center,
            child: Obx(() => Text(userName.value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),),
          ),
        ),
        const DividerComponent(),
        Expanded(
          child: Obx(() => ListView.separated(
            separatorBuilder: (context, index) =>
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            itemCount: listItems.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () => {onTap(index)},
                  child: ItemProfileComponent(config: listItems[index]),
                ),
              );
            } ,
          ),),
        ),
      ]
    );
  }

}