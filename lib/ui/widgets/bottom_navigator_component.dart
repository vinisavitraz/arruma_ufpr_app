import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:flutter/material.dart';
import 'bottom_navigator_item_component.dart';

class BottomNavigatorComponent extends StatelessWidget {

  final List<BottomNavigatorItemComponent> items;
  final int currentIndex;
  final void Function(int)? onTap;

  const BottomNavigatorComponent({
      Key? key,
      required this.items,
      this.currentIndex = 0,
      this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: items
                  .map((e) => e.copyWith(
                isActive: items.indexOf(e) == currentIndex,
                onTap: () => onTap!(items.indexOf(e)),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


