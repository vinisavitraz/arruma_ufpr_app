import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

class DividerComponent extends StatelessWidget {

  final double? ident;
  final double? endIdent;

  const DividerComponent({
    Key? key,
    this.ident,
    this.endIdent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: ident ?? 0,
      endIndent: endIdent ?? 0,
      color: AppColors.lightGrey,
    );
  }

}