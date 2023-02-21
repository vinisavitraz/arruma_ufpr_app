import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:get/get.dart';
import '../controller/create_location_page_controller.dart';

class CreateLocationPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CreateLocationPageController>(() {
      return CreateLocationPageController(
        locationRepository: LocationRepository(),
      );
    });
  }

}