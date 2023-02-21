import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/app/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app_info.dart';

class App extends StatelessWidget {

  final String initialRoute;

  const App({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppInfo.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryAccentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppPages.pages,
      initialRoute: initialRoute,
    );
  }

}