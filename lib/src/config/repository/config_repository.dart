import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import '../entity/item_profile.dart';

class ConfigRepository {

  List<ItemProfile> fetchConfigGroups() {
    return const [
      ItemProfile(
        name: 'Senha',
        description: 'Alterar senha',
        iconName: AppIcons.key,
        route: AppRoutes.updatePassword,
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