import 'package:arruma_ufpr_app/src/incident/repository/incident_interaction_repository.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:get/get.dart';
import 'incident_page_controller.dart';

class IncidentPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<IncidentPageController>(() {
      return IncidentPageController(
        incidentRepository: IncidentRepository(),
        incidentInteractionRepository: IncidentInteractionRepository(),
      );
    });
  }

}