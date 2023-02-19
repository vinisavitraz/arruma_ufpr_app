import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/src/item/repository/item_repository.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:get/get.dart';
import 'create_incident_page_controller.dart';

class CreateIncidentPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CreateIncidentPageController>(() {
      return CreateIncidentPageController(
        incidentRepository: IncidentRepository(),
        incidentTypeRepository: IncidentTypeRepository(),
        locationRepository: LocationRepository(),
        itemRepository: ItemRepository(),
      );
    });
  }

}