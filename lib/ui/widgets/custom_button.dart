import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function() onPressed;
  final Color shadowColor;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.shadowColor = AppColors.primaryColor,
    this.backgroundColor = AppColors.primaryAccentColor,
    this.textColor = AppColors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        shadowColor: shadowColor,
        minimumSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 0.07,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}