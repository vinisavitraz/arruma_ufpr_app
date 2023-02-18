import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:arruma_ufpr_app/src/profile/repository/profile_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/user_incidents_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/profile/profile_page_controller.dart';
import 'package:get/get.dart';
import 'authenticated_controller.dart';
import 'incident/incidents_page_controller.dart';

class AuthenticatedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticatedController>(() {
      return AuthenticatedController(
        authRepository: AuthRepository(),
        incidentRepository: IncidentRepository(),
      );
    });
    Get.lazyPut<IncidentsPageController>(() {
      return IncidentsPageController();
    });
    Get.lazyPut<UserIncidentsPageController>(() {
      return UserIncidentsPageController();
    });
    Get.lazyPut<ProfilePageController>(() {
      return ProfilePageController(
        profileRepository: ProfileRepository(),
      );
    });
  }
}