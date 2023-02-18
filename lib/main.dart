import 'package:arruma_ufpr_app/app.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  String initialRoute = await resolveInitialRoute();

  runApp(App(initialRoute: initialRoute));
}

Future<String> resolveInitialRoute() async {
  return AppRoutes.login;
}