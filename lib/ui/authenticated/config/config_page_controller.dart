import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/config/entity/item_profile.dart';
import 'package:arruma_ufpr_app/src/config/repository/config_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:get/get.dart';
// import 'package:mib_app/app/app.dart';
// import 'package:mib_app/domain/domain.dart';
// import 'package:mib_app/ui/authenticated/authenticated_controller.dart';
// import 'package:mib_app/ui/component/component.dart';

class ConfigPageController extends GetxController {

  // final AuthRepository authRepository;
  final ConfigRepository configRepository;
  //
  final AuthenticatedController authenticatedController = Get.find();

  ConfigPageController({
    required this.configRepository,
    // required this.configRepository,
  });

  List<ItemProfile> listItems = List<ItemProfile>.empty(growable: true).obs;
  var tabIndex = 0.obs;

  @override
  void onReady() async {
    super.onReady();

    fetchConfigGroups();
  }

  void fetchConfigGroups() {
    List<ItemProfile> configGroups;

    try {
      configGroups = configRepository.fetchConfigGroups();
    } on Exception catch (e) {
      //CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar as configurações, por favor tente novamente.');
      Get.snackbar('Erro!', e.toString());
      return;
    }

    showConfigGroups(configGroups);
  }

  void changeTabIndex(int newIndex) {
    tabIndex.value = newIndex + 1;
  }

  void returnToConfigList() {
    Get.back();
    tabIndex.value = 0;
  }

  void showConfigGroups(List<ItemProfile> items) {
    listItems.addAll(items);
  }

  Future<void> goToConfigPage(int index) async {
    String route = listItems[index].route;

    if (route == AppRoutes.exit) {
      await authenticatedController.logoutUser();
      return;
    }
    Get.toNamed(route);
  }

}