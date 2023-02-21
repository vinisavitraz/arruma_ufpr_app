import 'package:arruma_ufpr_app/src/incident/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/src/item/dto/request/create_item_request_dto.dart';
import 'package:arruma_ufpr_app/src/item/dto/request/update_item_request_dto.dart';
import 'package:arruma_ufpr_app/src/item/dto/response/item_response_dto.dart';
import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
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

  Future<ItemResponseDTO> getItem(int itemId) async {
    dynamic response = await AppHttpClient.client.get('/item/$itemId');

    return ItemResponseDTO.fromJson(response.data);
  }

  Future<ItemResponseDTO> createItem(CreateItemRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.post('/item', data: requestBody);

    return ItemResponseDTO.fromJson(response.data);
  }

  Future<ItemResponseDTO> updateItem(UpdateItemRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.put('/item', data: requestBody);

    return ItemResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> deleteItem(int itemId) async {
    dynamic response = await AppHttpClient.client.delete('/item/$itemId');

    return StatusResponseDTO.fromJson(response.data);
  }

}