import 'package:arruma_ufpr_app/src/item/repository/item_repository.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/create_item_page_controller.dart';
import 'package:get/get.dart';

class CreateItemPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CreateItemPageController>(() {
      return CreateItemPageController(
        itemRepository: ItemRepository(),
        locationRepository: LocationRepository(),
      );
    });
  }

}