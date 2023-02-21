import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/item/dto/response/items_response_dto.dart';
import 'package:arruma_ufpr_app/src/item/entity/item.dart';
import 'package:arruma_ufpr_app/src/item/repository/item_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class ItemsPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final ItemRepository itemRepository;

  final RxList<Item> listItems = <Item>[].obs;
  final RxBool pageLoading = true.obs;

  ItemsPageController({
    required this.itemRepository,
  });

  @override
  void onReady() async {
    super.onReady();

    await getItems();
  }

  Future<void> getItems() async {
    ItemsResponseDTO itemsResponseDTO;

    try {
      itemsResponseDTO = await itemRepository.getItems();
    } on Exception catch (e) {
      pageLoading.value = false;
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os itens, por favor tente novamente.');
      return;
    }
    pageLoading.value = false;

    if (itemsResponseDTO.items == null) {
      return;
    }

    listItems.assignAll(itemsResponseDTO.items!);
  }

  Future<void> deleteItem(Item item) async {

    try {
      await itemRepository.deleteItem(item.id!);
    } on Exception catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao remover o item, por favor tente novamente.');
      return;
    }
    List<Item> updatedList = List<Item>.from(listItems);
    updatedList.removeAt(updatedList.indexWhere((element) => element.id == item.id));
    listItems.assignAll(updatedList);

    Get.back();
  }

  void openCreateItemPage() {
    Get.toNamed(AppRoutes.createItem);
  }

  void showEditItemPage(Item item) {
    Get.toNamed(AppRoutes.createItem, arguments: {"item": item});
  }

}