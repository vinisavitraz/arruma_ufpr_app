import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/item/dto/response/items_response_dto.dart';
import 'package:arruma_ufpr_app/src/item/entity/item.dart';
import 'package:arruma_ufpr_app/src/item/repository/item_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final ItemRepository itemRepository;

  final RxList<Item> listItems = <Item>[].obs;
  final RxList<Item> originalListSearchItems = <Item>[].obs;
  final RxList<Item> filteredListSearchItems = <Item>[].obs;

  final RxBool pageLoading = true.obs;
  final MyTextField searchField = MyTextField();
  final RxBool searching = false.obs;

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

  void setField(MyTextField field, String value) {
    if (!searching.value) {
      searchField.setValue('');
      searching.value = true;
      originalListSearchItems.assignAll(listItems);
    }

    bool filterMore = true;

    if (field.getValue().length > value.length) {
      filterMore = false;
    }

    field.errorMessage.value = null;
    field.setValue(value);

    filterIncidentTypesList(value, filterMore);
  }

  Future<void> filterIncidentTypesList(String value, bool filterMore) async {
    if (value.isEmpty) {
      listItems.assignAll(originalListSearchItems);
      return;
    }

    if (filterMore) {
      filteredListSearchItems.assignAll(listItems.where((i) => matchItem(i, value)));
    } else {
      listItems.assignAll(originalListSearchItems);
      filteredListSearchItems.assignAll(listItems.where((i) => matchItem(i, value)));
    }

    listItems.assignAll(filteredListSearchItems);
  }

  bool matchItem(Item item, String value) {
    return item.id!.toString().toUpperCase().contains(value.toUpperCase())
        || item.name!.toUpperCase().contains(value.toUpperCase())
        || item.description!.toUpperCase().contains(value.toUpperCase())
        || item.locationName!.toUpperCase().contains(value.toUpperCase());
  }

  Future<void> onCancelSearch() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (searching.value) {
      searchField.setValue('');
      searching.value = false;
      listItems.assignAll(originalListSearchItems);
      return;
    }
  }

}