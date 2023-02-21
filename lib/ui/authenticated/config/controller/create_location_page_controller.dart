import 'package:arruma_ufpr_app/src/commons/exception/api_error_with_message_exception.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/location_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/authenticated/config/controller/locations_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';
import '../../../../src/location/dto/request/create_location_request_dto.dart';
import '../../../../src/location/dto/request/update_location_request_dto.dart';

class CreateLocationPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final LocationsPageController locationsPageController = Get.find();

  final RxString labelDescription = 'Criar local'.obs;
  final RxBool create = true.obs;

  final RxString errorMessage = ''.obs;
  final MyTextField nameField = MyTextField();
  final MyTextField descriptionField = MyTextField();

  final RxBool pageLoading = true.obs;
  final Rx<Location> location = Location().obs;

  final LocationRepository locationRepository;

  CreateLocationPageController({
    required this.locationRepository,
  });

  @override
  void onReady() async {
    super.onReady();


    if (Get.arguments == null || Get.arguments['location'] == null) {
      return;
    }

    labelDescription.value = 'Editar local';
    create.value = false;

    location.value = Get.arguments['location'];

    await getLocation();
  }

  Future<void> getLocation() async {
    LocationResponseDTO locationResponseDTO;

    try {
      locationResponseDTO = await locationRepository.getLocation(location.value.id!);
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao buscar o local, por favor tente novamente.');
      return;
    }

    location.value = locationResponseDTO.entity;
    location.refresh();

    nameField.setValue(location.value.name!);
    descriptionField.setValue(location.value.description!);
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
        await locationRepository.createLocation(
          CreateLocationRequestDTO(
              name: nameField.getValue(),
              description: descriptionField.getValue(),
            ),
        );
      } on ApiErrorWithMessageException catch (e) {
        errorMessage.value = e.errorMessage;
        return;
      } on Exception catch (e) {
        CustomSnackBar.showErrorSnackBar('Encontramos um problema ao criar o local, por favor tente novamente.');
        return;
      }

      await locationsPageController.getLocations();
      Get.back();
      return;
    }

    try {
      await locationRepository.updateLocation(
        UpdateLocationRequestDTO(
          id: location.value.id!,
          name: nameField.getValue(),
          description: descriptionField.getValue(),
        ),
      );
    } on ApiErrorWithMessageException catch (e) {
      errorMessage.value = e.errorMessage;
      return;
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao atualizar o local, por favor tente novamente.');
      return;
    }

    await locationsPageController.getLocations();
    Get.back();
  }

}