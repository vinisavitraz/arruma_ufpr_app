import 'package:arruma_ufpr_app/ui/authenticated/authenticated_base_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/create_incident_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/create_incident_page_binding.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incident_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incident_page_binding.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/login/login_page.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/login/login_page_binding.dart';
import 'package:get/get.dart';
import '../ui/authenticated/authenticated_binding.dart';
import 'app_routes.dart';

class AppPages {

  static final pages = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginPageBinding()
    ),
    GetPage(
        name: AppRoutes.authenticatedBase,
        page: () => const AuthenticatedBasePage(),
        binding: AuthenticatedBinding()
    ),
    GetPage(
        name: AppRoutes.incident,
        page: () => const IncidentPage(),
        binding: IncidentPageBinding()
    ),
    GetPage(
        name: AppRoutes.createIncident,
        page: () => const CreateIncidentPage(),
        binding: CreateIncidentPageBinding()
    ),
  ];

}