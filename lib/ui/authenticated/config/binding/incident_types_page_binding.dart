import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/incident_types_page_controller.dart';
import 'package:get/get.dart';

class IncidentTypesPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<IncidentTypesPageController>(() {
      return IncidentTypesPageController(
        incidentTypeRepository: IncidentTypeRepository(),
      );
    });
  }

}