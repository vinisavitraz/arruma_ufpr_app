import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/src/profile/entity/item_profile.dart';

class ProfileRepository {

  List<ItemProfile> fetchConfigGroups() {
    return const [
      ItemProfile(
        name: 'Senha',
        description: 'Alterar senha',
        iconName: AppIcons.key,
        route: AppRoutes.changePassword,
      ),
      ItemProfile(
        name: 'Perfil',
        description: 'Informações pessoais',
        iconName: AppIcons.profile,
        route: AppRoutes.editProfile,
      ),
      ItemProfile(
        name: 'Sair',
        description: 'Realizar logout',
        iconName: AppIcons.logout,
        route: AppRoutes.exit,
      ),

    ];
  }

}