import 'package:arruma_ufpr_app/ui/authenticated/authenticated_base_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/create_incident_type_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/create_location_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/create_user_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/incident_types_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/locations_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/update_password_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/page/users_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/create_incident_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/create_incident_page_binding.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incident_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incident_page_binding.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/login/login_page.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/login/login_page_binding.dart';
import 'package:arruma_ufpr_app/ui/unauthenticated/password/request_reset_password_page.dart';
import 'package:get/get.dart';
import '../ui/authenticated/authenticated_binding.dart';
import '../ui/authenticated/config/binding/create_incident_type_page_binding.dart';
import '../ui/authenticated/config/binding/create_location_page_binding.dart';
import '../ui/authenticated/config/binding/create_user_page_binding.dart';
import '../ui/authenticated/config/binding/incident_types_page_binding.dart';
import '../ui/authenticated/config/binding/locations_page_binding.dart';
import '../ui/authenticated/config/binding/profile_page_binding.dart';
import '../ui/authenticated/config/binding/update_password_page_binding.dart';
import '../ui/authenticated/config/binding/users_page_binding.dart';
import '../ui/authenticated/config/page/profile_page.dart';
import '../ui/unauthenticated/password/request_reset_password_page_binding.dart';
import 'app_routes.dart';

class AppPages {

  static final pages = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginPageBinding()
    ),
    GetPage(
        name: AppRoutes.requestResetPassword,
        page: () => const RequestResetPasswordPage(),
        binding: RequestResetPasswordPageBinding()
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
    GetPage(
        name: AppRoutes.incidentTypes,
        page: () => const IncidentTypesPage(),
        binding: IncidentTypesPageBinding()
    ),
    GetPage(
        name: AppRoutes.createIncidentType,
        page: () => const CreateIncidentTypePage(),
        binding: CreateIncidentTypePageBinding()
    ),
    GetPage(
        name: AppRoutes.locations,
        page: () => const LocationsPage(),
        binding: LocationsPageBinding()
    ),
    GetPage(
        name: AppRoutes.createLocation,
        page: () => const CreateLocationPage(),
        binding: CreateLocationPageBinding()
    ),
    GetPage(
        name: AppRoutes.users,
        page: () => const UsersPage(),
        binding: UsersPageBinding()
    ),
    GetPage(
        name: AppRoutes.createUser,
        page: () => const CreateUserPage(),
        binding: CreateUserPageBinding()
    ),
    GetPage(
        name: AppRoutes.updatePassword,
        page: () => const UpdatePasswordPage(),
        binding: UpdatePasswordPageBinding()
    ),
    GetPage(
        name: AppRoutes.editProfile,
        page: () => const ProfilePage(),
        binding: ProfilePageBinding()
    ),
  ];

}