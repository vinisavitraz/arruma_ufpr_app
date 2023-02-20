import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/src/config/entity/item_profile.dart';
import 'package:flutter/material.dart';

class ItemProfileComponent extends StatelessWidget {

  final ItemProfile config;

  const ItemProfileComponent({
    Key? key,
    required this.config
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
          child: AppIcon(
            config.iconName,
            size: const Size(22, 22), //mediaquerychange
            color: AppColors.primaryAccentColor,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(config.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(config.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}