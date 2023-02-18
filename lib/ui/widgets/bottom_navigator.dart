import 'package:flutter/material.dart';

import 'bottom_navigator_component.dart';
import 'bottom_navigator_item_component.dart';
//import 'package:mib_app/app/app.dart';

class BottomNavigator extends StatelessWidget {

  final Function(int) onTap;
  final int currentIndex;
  final List<BottomNavigatorItemComponent> items;

  const BottomNavigator({
    Key? key,
    required this.onTap,
    required this.currentIndex,
    required this.items,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigatorComponent(
      onTap: onTap,
      currentIndex: currentIndex,
      items: items,
    );
  }

}