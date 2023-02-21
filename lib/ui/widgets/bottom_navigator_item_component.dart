import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:flutter/material.dart';
//import 'package:mib_app/app/app.dart';

class BottomNavigatorItemComponent extends StatelessWidget {
  final String label;
  final String activeIcon;
  final String icon;
  final bool isActive;
  final void Function()? onTap;

  BottomNavigatorItemComponent copyWith(
      {
        String? label,
        String? activeIcon,
        String? icon,
        bool? isActive,
        void Function()? onTap}) {
    return BottomNavigatorItemComponent(
      label: label ?? this.label,
      activeIcon: activeIcon ?? this.activeIcon,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
      onTap: onTap ?? this.onTap,
    );
  }

  const BottomNavigatorItemComponent({
    Key? key,
    required this.label,
    required this.activeIcon,
    required this.icon,
    this.isActive = false,
    this.onTap
  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppIcon(
            isActive ? activeIcon : icon,
            color: isActive ? AppColors.primaryColor : AppColors.primaryAccentColor,
            size: const Size(20, 20),
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 10,
                color: isActive ? AppColors.primaryAccentColor : AppColors.accentGrey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }

}