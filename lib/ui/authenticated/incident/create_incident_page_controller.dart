import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
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
  final List<SelectItem> incidentTypeOptions = List<SelectItem>.empty(growable: true);
  final List<SelectItem> locationOptions = List<SelectItem>.empty(growable: true);
  final List<SelectItem> itemOptions = List<SelectItem>.empty(growable: true);
  //
  // final MarketRepository marketRepository;
  // final ShopRepository shopRepository;
  //
  // IncidentPageController({
  //   required this.marketRepository,
  //   required this.shopRepository,
  // });

  late Rx<Incident> incident = Incident().obs;

  void showForm(RxBool showForm, bool show) {
    showForm.value = show;
  }

  @override
  void onReady() async {
    super.onReady();

    pageLoading.value = false;
  }

}