import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';
import 'package:arruma_ufpr_app/src/incident/repository/incident_type_repository.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/locations_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/entity/location.dart';
import 'package:arruma_ufpr_app/src/location/repository/location_repository.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/users_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/entity/user.dart';
import 'package:arruma_ufpr_app/src/user/repository/user_repository.dart';
import 'package:arruma_ufpr_app/ui/authenticated/authenticated_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class UsersPageController extends GetxController {

  final AuthenticatedController authenticatedController = Get.find();
  final UserRepository userRepository;
  final RxList<User> listUsers = <User>[].obs;

  UsersPageController({
    required this.userRepository,
  });

  @override
  void onReady() async {
    super.onReady();

    await getUsers();
  }

  Future<void> getUsers() async {
    UsersResponseDTO usersResponseDTO;

    try {
      usersResponseDTO = await userRepository.getUsers();
    } on Exception catch (e) {
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar os usuários, por favor tente novamente.');
      return;
    }

    if (usersResponseDTO.users == null) {
      return;
    }

    listUsers.assignAll(usersResponseDTO.users!);
  }

  Future<void> deleteUser(User user) async {

    try {
      await userRepository.deleteUser(user.id!);
    } on Exception catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar('Encontramos um problema ao remover o usuário, por favor tente novamente.');
      return;
    }
    List<User> updatedList = List<User>.from(listUsers);
    updatedList.removeAt(updatedList.indexWhere((element) => element.id == user.id));
    listUsers.assignAll(updatedList);

    Get.back();
  }

  void openCreateUserPage() {
    Get.toNamed(AppRoutes.createUser);
  }

  void showEditUserPage(User user) {
    Get.toNamed(AppRoutes.createUser, arguments: {"user": user});
  }

}