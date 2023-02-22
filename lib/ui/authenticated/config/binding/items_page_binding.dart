import 'package:arruma_ufpr_app/src/item/repository/item_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/items_page_controller.dart';
import 'package:get/get.dart';

class ItemsPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ItemsPageController>(() {
      return ItemsPageController(
        itemRepository: ItemRepository(),
      );
    });
  }

}