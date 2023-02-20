import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/config/repository/config_repository.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/config_page_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/user_incidents_page_controller.dart';
import 'package:get/get.dart';
import 'authenticated_controller.dart';
import 'incident/incidents_page_controller.dart';

class AuthenticatedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticatedController>(() {
      return AuthenticatedController(
        authRepository: AuthRepository(),
        userRepository: UserRepository(),
        incidentRepository: IncidentRepository(),
      );
    });
    Get.lazyPut<IncidentsPageController>(() {
      return IncidentsPageController();
    });
    Get.lazyPut<UserIncidentsPageController>(() {
      return UserIncidentsPageController();
    });
    Get.lazyPut<ConfigPageController>(() {
      return ConfigPageController(
        configRepository: ConfigRepository(),
      );
    });
  }
}