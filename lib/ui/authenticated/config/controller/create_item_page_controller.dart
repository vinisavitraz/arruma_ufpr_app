import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/item/dto/response/item_response_dto.dart';
import 'package:arruma_ufpr_app/src/item/entity/item.dart';
import 'package:arruma_ufpr_app/src/item/repository/item_repository.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/locations_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/src/ui/select_item.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/items_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';
import '../../../../src/item/dto/request/create_item_request_dto.dart';
import '../../../../src/item/dto/request/update_item_request_dto.dart';

class CreateItemPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final ItemsPageController itemsPageController = Get.find();

  final RxString labelDescription = 'Criar item'.obs;
  final RxBool create = true.obs;

  final RxString errorMessage = ''.obs;
  final MyTextField nameField = MyTextField();
  final MyTextField descriptionField = MyTextField();
  final MyTextField locationIdField = MyTextField();

  final RxBool pageLoading = true.obs;
  final Rx<Item> item = Item().obs;
  final RxList<Location> listLocations = <Location>[].obs;
  final RxList<SelectItem> locationOptions = <SelectItem>[].obs;

  final ItemRepository itemRepository;
  final LocationRepository locationRepository;

  CreateItemPageController({
    required this.itemRepository,
    required this.locationRepository,
  });

  @override
  void onReady() async {
    super.onReady();

    await getLocations();

    if (Get.arguments == null || Get.arguments['item'] == null) {
      return;
    }

    labelDescription.value = 'Editar item';
    create.value = false;

    item.value = Get.arguments['item'];

    await getItem();
  }

  Future<void> getLocations() async {
    LocationsResponseDTO locationsResponseDTO;

    try {
      locationsResponseDTO = await locationRepository.getLocations();
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os locais, por favor tente novamente.');
      return;
    }

    if (locationsResponseDTO.locations == null) {
      return;
    }

    listLocations.assignAll(locationsResponseDTO.locations!);

    List<SelectItem> locations = List<SelectItem>.empty(growable: true);
    for (Location location in listLocations) {
      locations.add(SelectItem(text: location.name!, value: location.id!.toString()));
    }
    locationOptions.assignAll(locations);
  }

  Future<void> getItem() async {
    ItemResponseDTO itemResponseDTO;

    try {
      itemResponseDTO = await itemRepository.getItem(item.value.id!);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao buscar o itemm, por favor tente novamente.');
      return;
    }

    item.value = itemResponseDTO.entity;
    item.refresh();

    nameField.setValue(item.value.name!);
    descriptionField.setValue(item.value.description!);
    locationIdField.setValue(item.value.locationId!.toString());
  }

  Future<void> save() async {
    if (nameField.getValue().isEmpty) {
      nameField.errorMessage.value = 'Informe o nome';
      return;
    }
    if (descriptionField.getValue().isEmpty) {
      descriptionField.errorMessage.value = 'Informe a descrição';
      return;
    }

    if (create.value) {
      try {
        await itemRepository.createItem(
          CreateItemRequestDTO(
            name: nameField.getValue(),
            description: descriptionField.getValue(),
            locationId: int.parse(locationIdField.getValue()),
          ),
        );
      } on ApiErrorWithMessageException catch (e) {
        errorMessage.value = e.errorMessage;
        return;
      } on Exception catch (e) {
        CustomSnackBar.showErrorSnackBar('Encontramos um problema ao criar o item, por favor tente novamente.');
        return;
      }

      await itemsPageController.getItems();
      Get.back();
      return;
    }

    try {
      await itemRepository.updateItem(
        UpdateItemRequestDTO(
          id: item.value.id!,
          name: nameField.getValue(),
          description: descriptionField.getValue(),
          locationId: int.parse(locationIdField.getValue()),
        ),
      );
    } on ApiErrorWithMessageException catch (e) {
      errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao atualizar o item, por favor tente novamente.');
      return;
    }

    await itemsPageController.getItems();
    Get.back();
  }

}