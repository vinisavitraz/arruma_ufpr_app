import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:get/get.dart';

class CreateIncidentTypePageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();

  final RxString errorMessage = ''.obs;
  final MyTextField nameField = MyTextField();
  final MyTextField descriptionField = MyTextField();
  // CreateIncidentTypePageController({
  //   required this.incidentTypeRepository,
  // });

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> save() async {

  }

}