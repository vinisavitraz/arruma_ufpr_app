import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:get/get.dart';

class CustomSnackBar {

  static void showSnackBar(String title, String message) {
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
      duration: const Duration(seconds: 5),
      isDismissible: true,
    );
  }

  static void showErrorSnackBar(String message) {
    Get.snackbar('Ops!', message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
      duration: const Duration(seconds: 5),
    );
  }

}