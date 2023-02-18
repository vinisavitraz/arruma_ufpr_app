
import 'package:arruma_ufpr_app/app/app_icons.dart';
import 'package:arruma_ufpr_app/app/app_routes.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/incidents_page.dart';
import 'package:arruma_ufpr_app/ui/authenticated/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/bottom_navigator_item_component.dart';

class AuthenticatedController extends GetxController {
  //
  // final ShopController shopController = Get.find();
  //
  final RxBool pageLoading = false.obs;
  //
  final RxInt tabIndex = 0.obs;
  // final RxBool marketSet = false.obs;
  // final RxInt marketId = 0.obs;
  // final RxString marketName = 'Desconectado'.obs;
  // final RxString marketAddress = ''.obs;
  // final RxString marketImagePath = ''.obs;
  //
  final RxString userName = ''.obs;
  // final RxInt userId = 0.obs;
  // final RxInt customerId = 0.obs;
  // final RxBool mfaEnabled = false.obs;
  // final RxBool admin = false.obs;
  //
  // final AuthRepository authRepository;
  // final UserRepository userRepository;
  // final MarketRepository marketRepository;
  // final ShopRepository shopRepository;
  //
  final RxList<Widget> activePages = <Widget>[].obs;
  final RxList<BottomNavigatorItemComponent> bottomNavigatorItems = <BottomNavigatorItemComponent>[].obs;

  // AuthenticatedController({
  //   // required this.authRepository,
  //   // required this.userRepository,
  //   // required this.marketRepository,
  //   // required this.shopRepository,
  // });

  @override
  void onInit() async {
    super.onInit();
    loadPagesAndBottomNavigatorItems(false);
    //
    // marketSet.listen((marketSet) {
    //   loadPagesAndBottomNavigatorItems(marketSet);
    // });
  }

  @override
  void onReady() async {
    super.onReady();


    // UserInfo userInfo = await authRepository.getActiveUserInfo();
    //
    // print('Active user info: ${userInfo.userEmail}');
    // print('Status: ${userInfo.status}');
    // print('Customer id: ${userInfo.customerId ?? 0}');
    // userId.value = userInfo.userId;
    // customerId.value = userInfo.customerId ?? 0;
    // userName.value = userInfo.userName;
    // mfaEnabled.value = userInfo.mfaEnabled == 1 ? true : false;
    //
    // if (customerId.value == 0) {
    //   admin.value = true;
    // }
    //
    // if (userInfo.status == 'ACCEPT_TERMS') {
    //   Get.offAllNamed(AppRoutes.TERMS_OF_USAGE, arguments: {"user_id": userInfo.userId});
    //   return;
    // }
    //
    // await setupFirebaseToken();
    //
    // if (userInfo.marketId != null && userInfo.marketId! > 0) {
    //   final int marketId = userInfo.marketId!;
    //   await FirebaseMessaging.instance.unsubscribeFromTopic('MARKET_$marketId');
    // }
    //
    // await refreshUserMarket();
    //
    //
    // pageLoading.value = false;
    // print('finished authenticated!');
    // if (notification != null) {
    //   _handleMessage(notification);
    // }
  }
  //
  void selectNewPageFromTab(BottomNavigatorItemComponent e) {
    print('selectNewPageFromTab');
    print(e.label);
    int newIndex = bottomNavigatorItems.indexOf(e);
    print(newIndex);
    print(bottomNavigatorItems.length);
    tabIndex.value = newIndex;
  }
  //
  // Future<void> setNewMarket(int marketId) async {
  //   try {
  //     await userRepository.setMarket(customerId.value, marketId);
  //   } on Exception catch (e) {
  //     CustomSnackBar.showErrorSnackBar('Encontramos um problema ao encontrar esse mercado, por favor tente novamente.');
  //     return;
  //   }
  //
  //   await refreshUserMarket();
  // }
  //
  // Future<void> refreshUserMarket() async {
  //   await clearMarketInformation(marketId.value);
  //
  //   marketSet.value = false;
  //
  //   UserResponseDTO userResponseDTO;
  //
  //   try {
  //     userResponseDTO = await userRepository.findUserByID(userId.value);
  //   } on Exception catch (e) {
  //     CustomSnackBar.showErrorSnackBar('Encontramos um problema ao encontrar esse mercado, por favor tente novamente.');
  //     return;
  //   }
  //
  //   if ((userResponseDTO.marketId ?? 0) > 0) {
  //     final int newMarketId = userResponseDTO.marketId!;
  //     marketId.value = newMarketId;
  //     fetchUserMarket();
  //     return;
  //   }
  //
  //   await clearMarketInformation(userResponseDTO.marketId ?? 0);
  // }
  //
  // Future<void>
  // fetchUserMarket() async {
  //   print('fetchUserMarket');
  //   if (marketId.value <= 0) {
  //     print('marketId.value <= 0');
  //     return;
  //   }
  //   Market market;
  //
  //   try {
  //     market = await marketRepository.fetchMarket(marketId.value);
  //   } on Exception catch (e) {
  //     CustomSnackBar.showErrorSnackBar('Encontramos um problema ao procurar esse mercado, por favor tente novamente.');
  //     await clearMarketInformation(marketId.value);
  //     return;
  //   }
  //
  //   marketSet.value = true;
  //   print('market set trye!');
  //   print(market.name);
  //   print(market.id);
  //   print(customerId.value);
  //   showMarketInformation(market);
  //   print('fetchUserShopAndShowBasket');
  //
  //   FirebaseMessaging.instance.subscribeToTopic('MARKET_${marketId.value}');
  //   await shopController.fetchUserShopAndShowBasket(marketId.value, customerId.value);
  // }
  //
  // void showMarketInformation(Market market) {
  //   print('showMarketInformation');
  //   marketName.value = market.name;
  //   marketAddress.value = market.address;
  //   print(market.imagePath);
  //   marketImagePath.value = market.imagePath;
  // }
  //
  // Future<void> clearMarketInformation(int marketId) async {
  //   marketSet.value = false;
  //   marketName.value = 'Desconectado';
  //   marketAddress.value = '';
  //   shopController.clearShopInformation();
  //
  //   if (marketId > 0) {
  //     await FirebaseMessaging.instance.unsubscribeFromTopic('MARKET_$marketId');
  //   }
  // }
  //
  // Future<void> setupFirebaseToken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   await saveTokenToDatabase(token!);
  //   FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  // }
  //
  // Future<void> saveTokenToDatabase(String token) async {
  //   await userRepository.setUserDeviceToken(SetUserDeviceTokenRequestDTO(
  //     userId: userId.value,
  //     token: token,
  //   ));
  // }
  //
  // void _handleMessage(RemoteMessage message) {
  //   print('_handleMessage');
  //   message.data.forEach((key, value) {
  //     print(key);
  //     print(value);
  //   });
  //
  //   final String route = getRouteByNotificationType(message);
  //   Get.toNamed(route);
  // }
  //
  // String getRouteByNotificationType(RemoteMessage notification) {
  //   if (notification.data['page'] == 'chat') {
  //     return AppRoutes.CHAT;
  //   }
  //
  //   if (notification.data['page'] == 'shop') {
  //     return AppRoutes.SHOP;
  //   }
  //
  //   return AppRoutes.AUTHENTICATED_BASE;
  // }
  //
  Future<void> logoutUser() async {
    //Token? token = await authRepository.getActiveTokenFromInternalCache();
    //
    // if (token == null) {
    //   Get.snackbar('Erro!', 'Token nao encontrado!');
    //   Get.offAllNamed(AppRoutes.LOGIN);
    //   return;
    // }

    try {
     // await authRepository.logoutUser();
    } on Exception catch (e) {
    //  CustomSnackBar.showErrorSnackBar('Encontramos um problema durante o logout.');
    } finally {
      // await authRepository.removeToken();
      // await authRepository.removeLastPaymentTypeUsed();
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void loadPagesAndBottomNavigatorItems(bool marketSet) {
    List<Widget> pages = List<Widget>.empty(growable: true);
    List<BottomNavigatorItemComponent> items = List<BottomNavigatorItemComponent>.empty(growable: true);

    pages.add(IncidentsPage());

    items.add(BottomNavigatorItemComponent(
      label: 'Incidentes',
      activeIcon: AppIcons.activeIncident,
      icon: AppIcons.incident,
    ));

    pages.add(ProfilePage());
    items.add(BottomNavigatorItemComponent(
      label: 'Perfil',
      activeIcon: AppIcons.activeProfile,
      icon: AppIcons.profile,
    ));
    //
    // if (marketSet) {
    //   pages.add(SearchPage());
    //   items.add(BottomNavigatorItemComponent(
    //       label: 'Busca',
    //       activeIcon: AppIcons.searchActive,
    //       icon: AppIcons.search
    //   ));
    // }
    //
    // pages.add(ShoppingsPage());
    // items.add(BottomNavigatorItemComponent(
    //   label: 'Compras',
    //   activeIcon: AppIcons.ordersActive,
    //   icon: AppIcons.orders,
    // ));
    //
    // pages.add(SettingsPage());
    // items.add(BottomNavigatorItemComponent(
    //   label: 'Ajustes',
    //   activeIcon: AppIcons.profileActive,
    //   icon: AppIcons.profile,
    // ));

    activePages.assignAll(pages);
    bottomNavigatorItems.assignAll(items);
  }

}