
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:get/get.dart';

import '../controller/locations_page_controller.dart';

class LocationsPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LocationsPageController>(() {
      return LocationsPageController(
        locationRepository: LocationRepository(),
      );
    });
  }

}