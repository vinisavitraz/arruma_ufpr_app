import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/locations_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationsPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final LocationRepository locationRepository;
  final RxList<Location> listLocations = <Location>[].obs;
  final RxList<Location> originalListSearchLocations = <Location>[].obs;
  final RxList<Location> filteredListSearchLocations = <Location>[].obs;

  final RxBool pageLoading = true.obs;
  final MyTextField searchField = MyTextField();
  final RxBool searching = false.obs;

  LocationsPageController({
    required this.locationRepository,
  });

  @override
  void onReady() async {
    super.onReady();

    await getLocations();
  }

  Future<void> getLocations() async {
    LocationsResponseDTO locationsResponseDTO;

    try {
      locationsResponseDTO = await locationRepository.getLocations();
    } on Exception catch (e) {
      pageLoading.value = false;
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os tipos de incidente, por favor tente novamente.');
      return;
    }
    pageLoading.value = false;

    if (locationsResponseDTO.locations == null) {
      return;
    }

    listLocations.assignAll(locationsResponseDTO.locations!);
  }

  Future<void> deleteLocation(Location location) async {

    try {
      await locationRepository.deleteLocation(location.id!);
    } on Exception catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao remover o local, por favor tente novamente.');
      return;
    }
    List<Location> updatedList = List<Location>.from(listLocations);
    updatedList.removeAt(updatedList.indexWhere((element) => element.id == location.id));
    listLocations.assignAll(updatedList);

    Get.back();
  }

  void openCreateLocationPage() {
    Get.toNamed(AppRoutes.createLocation);
  }

  void showEditLocationPage(Location location) {
    Get.toNamed(AppRoutes.createLocation, arguments: {"location": location});
  }

  void setField(MyTextField field, String value) {
    if (!searching.value) {
      searchField.setValue('');
      searching.value = true;
      originalListSearchLocations.assignAll(listLocations);
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
      listLocations.assignAll(originalListSearchLocations);
      return;
    }

    if (filterMore) {
      filteredListSearchLocations.assignAll(listLocations.where((i) => matchLocation(i, value)));
    } else {
      listLocations.assignAll(originalListSearchLocations);
      filteredListSearchLocations.assignAll(listLocations.where((i) => matchLocation(i, value)));
    }

    listLocations.assignAll(filteredListSearchLocations);
  }

  bool matchLocation(Location location, String value) {
    return location.id!.toString().toUpperCase().contains(value.toUpperCase())
        || location.name!.toUpperCase().contains(value.toUpperCase())
        || location.description!.toUpperCase().contains(value.toUpperCase());
  }

  Future<void> onCancelSearch() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (searching.value) {
      searchField.setValue('');
      searching.value = false;
      listLocations.assignAll(originalListSearchLocations);
      return;
    }
  }

}