import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/create_incident_type_page_controller.dart';
import 'package:get/get.dart';

class CreateIncidentTypePageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CreateIncidentTypePageController>(() {
      return CreateIncidentTypePageController(
        incidentTypeRepository: IncidentTypeRepository(),
      );
    });
  }

}