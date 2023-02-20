import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialogComponent extends StatelessWidget {

  final String text;

  const ConfirmDialogComponent({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.maxFinite,
            child: InkWell(
              onTap: () => {Get.back()},
              child: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text('OK',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}