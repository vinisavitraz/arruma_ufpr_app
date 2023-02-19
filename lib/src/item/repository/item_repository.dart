import 'package:arruma_ufpr_app/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/item/dto/response/items_response_dto.dart';

class ItemRepository {

  Future<ItemsResponseDTO> getItems() async {
    dynamic response = await AppHttpClient.client.get('/item');

    return ItemsResponseDTO.fromJson(response.data);
  }

  Future<ItemsResponseDTO> getItemsByLocationId(String locationId) async {
    dynamic response = await AppHttpClient.client.get('/item/location/$locationId');

    return ItemsResponseDTO.fromJson(response.data);
  }

}