import 'package:arruma_ufpr_app/app.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/services/storage/cache.dart';
import 'package:arruma_ufpr_app/src/auth/entity/token.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Cache.initStorage();

  String initialRoute = await resolveInitialRoute();

  runApp(App(initialRoute: initialRoute));
}

Future<String> resolveInitialRoute() async {
  final AuthRepository authRepository = AuthRepository();
  final Token? activeToken = await authRepository.getActiveTokenFromInternalCache();

  if (activeToken == null) {
    return AppRoutes.login;
  }

  final bool validToken = await authRepository.validateToken(activeToken);

  if (!validToken) {
    return AppRoutes.login;
  }

  return AppRoutes.authenticatedBase;
}