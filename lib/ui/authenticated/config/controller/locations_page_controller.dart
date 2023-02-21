import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/locations_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class LocationsPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final LocationRepository locationRepository;
  final RxList<Location> listLocations = <Location>[].obs;
  final RxBool pageLoading = true.obs;

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

}