import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import '../entity/item_profile.dart';

class ConfigRepository {

  List<ItemProfile> fetchConfigGroups(bool isAdmin) {
    List<ItemProfile> configItems = List<ItemProfile>.empty(growable: true);

    if (isAdmin) {
      configItems.add(
          ItemProfile(
            name: 'Tipos',
            description: 'Gerenciar tipos de incidente',
            iconName: AppIcons.incidentType,
            route: AppRoutes.incidentTypes,
          ),
      );
      configItems.add(
        ItemProfile(
          name: 'Locais',
          description: 'Gerenciar locais',
          iconName: AppIcons.location,
          route: AppRoutes.locations,
        ),
      );
      configItems.add(
        ItemProfile(
          name: 'Itens',
          description: 'Gerenciar itens',
          iconName: AppIcons.item,
          route: AppRoutes.items,
        ),
      );
      configItems.add(
        ItemProfile(
          name: 'Usuários',
          description: 'Gerenciar usuários',
          iconName: AppIcons.user,
          route: AppRoutes.users,
        ),
      );
    }

    configItems.addAll(
        [
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
        ]
    );

    return configItems;
  }

}