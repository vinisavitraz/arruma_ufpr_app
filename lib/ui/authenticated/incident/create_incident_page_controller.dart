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

class CreateIncidentPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final RxBool pageLoading = true.obs;

  final RxBool showIncidentTypeForm = false.obs;
  final RxBool showLocationForm = false.obs;
  final RxBool showItemForm = false.obs;

  final RxBool validForm = false.obs;

  final MyTextField title = MyTextField();
  final MyTextField description = MyTextField();
  final MyTextField incidentTypeId = MyTextField();
  final MyTextField locationId = MyTextField();
  final MyTextField itemId = MyTextField();
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

  void showForm(String origin, RxBool showForm, bool show) {
    showForm.value = show;

    if (origin == 'location' && showForm.value) {
      showItemForm.value = true;
    }
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
    await getItemsByLocationID(locationId);
  }

}