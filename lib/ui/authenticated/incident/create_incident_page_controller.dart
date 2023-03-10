import 'dart:io';

import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/incident/dto/request/create_incident_request_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_repository.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/src/item/dto/response/items_response_dto.dart';
import 'package:arruma_ufpr_app/src/item/entity/item.dart';
import 'package:arruma_ufpr_app/src/item/repository/item_repository.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/locations_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/src/ui/select_item.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateIncidentPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final RxBool pageLoading = true.obs;

  final RxBool showIncidentTypeForm = false.obs;
  final RxBool showLocationForm = false.obs;
  final RxBool showItemForm = false.obs;

  final RxBool validForm = false.obs;
  final ImagePicker _picker = ImagePicker();
  XFile? file;
  final RxString imagePath = ''.obs;

  final MyTextField titleField = MyTextField();
  final MyTextField descriptionField = MyTextField();
  final MyTextField incidentTypeIdField = MyTextField();
  final MyTextField incidentTypeNameField = MyTextField();
  final MyTextField incidentTypeDescriptionField = MyTextField();
  final MyTextField locationIdField = MyTextField();
  final MyTextField locationNameField = MyTextField();
  final MyTextField locationDescriptionField = MyTextField();
  final MyTextField itemIdField = MyTextField();
  final MyTextField itemNameField = MyTextField();
  final MyTextField itemDescriptionField = MyTextField();


  final RxList<SelectItem> incidentTypeOptions = <SelectItem>[].obs;
  final RxList<SelectItem> locationOptions = <SelectItem>[].obs;
  final RxList<SelectItem> itemOptions = <SelectItem>[].obs;

  final RxList<IncidentType> listIncidentTypes = <IncidentType>[].obs;
  final RxList<Location> listLocations = <Location>[].obs;
  final RxList<Item> listItems = <Item>[].obs;

  final IncidentRepository incidentRepository;
  final IncidentTypeRepository incidentTypeRepository;
  final LocationRepository locationRepository;
  final ItemRepository itemRepository;

  CreateIncidentPageController({
    required this.incidentRepository,
    required this.incidentTypeRepository,
    required this.locationRepository,
    required this.itemRepository,
  });

  late Rx<Incident> incident = Incident().obs;

  void showForm(String origin, RxBool showForm, bool show, MyTextField selectField) {
    if (origin == 'item' && showLocationForm.value && !show) {
      return;
    }
    if (origin == 'location' && show) {
      showItemForm.value = true;
    }

    showForm.value = show;
  }

  @override
  void onReady() async {
    super.onReady();

    await getIncidentTypes();
    await getLocations();
    listItems.assignAll([]);
    itemOptions.assignAll([]);

    pageLoading.value = false;
  }

  Future<void> getIncidentTypes() async {
    IncidentTypesResponseDTO incidentTypesResponseDTO;

    try {
      incidentTypesResponseDTO = await incidentTypeRepository.getIncidentTypes();
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os tipos de incidente, por favor tente novamente.');
      return;
    }

    if (incidentTypesResponseDTO.incidentTypes == null) {
      return;
    }

    listIncidentTypes.assignAll(incidentTypesResponseDTO.incidentTypes!);

    List<SelectItem> incidentTypes = List<SelectItem>.empty(growable: true);
    for (IncidentType incidentType in listIncidentTypes) {
      incidentTypes.add(SelectItem(text: incidentType.name!, value: incidentType.id!.toString()));
    }
    incidentTypeOptions.assignAll(incidentTypes);
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

  Future<void> getItemsByLocationID(String locationId) async {
    ItemsResponseDTO itemsResponseDTO;

    try {
      itemsResponseDTO = await itemRepository.getItemsByLocationId(locationId);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os locais, por favor tente novamente.');
      return;
    }

    if (itemsResponseDTO.items == null) {
      return;
    }

    listItems.assignAll(itemsResponseDTO.items!);

    List<SelectItem> items = List<SelectItem>.empty(growable: true);
    for (Item item in listItems) {
      items.add(SelectItem(text: item.name!, value: item.id!.toString()));
    }
    itemOptions.assignAll(items);
  }

  Future<void> handleNewLocationSelected(String locationId) async {
    locationIdField.setValue(locationId);
    await getItemsByLocationID(locationId);
  }

  Future<void> createIncident() async {
    clearErrors();
    String title = titleField.getValue();
    String description = descriptionField.getValue();
    int incidentTypeId = incidentTypeIdField.getValue().isNotEmpty ? int.parse(incidentTypeIdField.getValue()) : 0;
    String incidentTypeName = incidentTypeNameField.getValue();
    String incidentTypeDescription = incidentTypeDescriptionField.getValue();
    int locationId = locationIdField.getValue().isNotEmpty ? int.parse(locationIdField.getValue()) : 0;
    String locationName = locationNameField.getValue();
    String locationDescription = locationDescriptionField.getValue();
    int itemId = itemIdField.getValue().isNotEmpty ? int.parse(itemIdField.getValue()) : 0;
    String itemName = itemNameField.getValue();
    String itemDescription = itemDescriptionField.getValue();

    if (showIncidentTypeForm.value) {
      if (incidentTypeName.isEmpty) {
        incidentTypeNameField.errorMessage.value = 'Informe o nome';
        return;
      }
      if (incidentTypeDescription.isEmpty) {
        incidentTypeDescriptionField.errorMessage.value = 'Informe a descri????o';
        return;
      }

      incidentTypeId = 0;
    } else {
      if (incidentTypeId == 0) {
        incidentTypeIdField.errorMessage.value = 'Selecione o tipo';
        return;
      }
    }

    if (showLocationForm.value) {
      if (locationName.isEmpty) {
        locationNameField.errorMessage.value = 'Informe o nome';
        return;
      }
      if (locationDescription.isEmpty) {
        locationDescriptionField.errorMessage.value = 'Informe a descri????o';
        return;
      }

      locationId = 0;
    } else {
      if (locationId == 0) {
        locationIdField.errorMessage.value = 'Selecione o local';
        return;
      }
    }

    if (showItemForm.value) {
      if (itemName.isEmpty) {
        itemNameField.errorMessage.value = 'Informe o nome';
        return;
      }
      if (itemDescription.isEmpty) {
        itemDescriptionField.errorMessage.value = 'Informe a descri????o';
        return;
      }

      itemId = 0;
    } else {
      if (itemId == 0) {
        itemIdField.errorMessage.value = 'Selecione o item';
        return;
      }
    }

    if (title.isEmpty) {
      titleField.errorMessage.value = 'Informe o t??tulo';
      return;
    }
    if (description.isEmpty) {
      descriptionField.errorMessage.value = 'Informe a descri????o';
      return;
    }

    pageLoading.value = true;

    CreateIncidentRequestDTO requestBody = CreateIncidentRequestDTO(
      title: title,
      description: description,
      incidentTypeId: incidentTypeId,
      incidentTypeName: incidentTypeName,
      incidentTypeDescription: incidentTypeDescription,
      locationId: locationId,
      locationName: locationName,
      locationDescription: locationDescription,
      itemId: itemId,
      itemName: itemName,
      itemDescription: itemDescription,
      userId: authenticatedController.authenticatedUser.value.id!,
    );

    print(requestBody.toJson());

    IncidentResponseDTO incidentResponseDTO;

    try {
      incidentResponseDTO = await incidentRepository.createIncident(requestBody);
    } on Exception catch (e) {
      pageLoading.value = false;
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao criar um incidente, por favor tente novamente.');
      return;
    }
    await authenticatedController.refreshIncidentsList();

    if (file != null) {
      try {
        await incidentRepository.addImageToIncident(incidentResponseDTO.entity.id!, file!);
      } on Exception catch (e) {
        pageLoading.value = false;
        CustomSnackBar.showErrorSnackBar('Encontramos um problema ao adicionar a imagem ao incidente, por favor tente novamente.');
        return;
      }
    }

    pageLoading.value = false;

    Get.offNamed(AppRoutes.incident, arguments: {"incident": incidentResponseDTO.entity});
  }

  void clearErrors() {
    titleField.errorMessage.value = '';
    descriptionField.errorMessage.value = '';
    incidentTypeIdField.errorMessage.value = '';
    incidentTypeNameField.errorMessage.value = '';
    incidentTypeDescriptionField.errorMessage.value = '';
    locationIdField.errorMessage.value = '';
    locationNameField.errorMessage.value = '';
    locationDescriptionField.errorMessage.value = '';
    itemIdField.errorMessage.value = '';
    itemNameField.errorMessage.value = '';
    itemDescriptionField.errorMessage.value = '';
  }

  Future<void> chooseImageFromGallery() async {
    file = await _picker.pickImage(source: ImageSource.gallery);

    if (file == null) {
      return;
    }

    imagePath.value = file!.path;
  }

  Future<void> captureNewImage() async {
    file = await _picker.pickImage(source: ImageSource.camera);

    if (file == null) {
      return;
    }

    imagePath.value = file!.path;
  }

}