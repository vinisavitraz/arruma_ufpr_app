import 'package:arruma_ufpr_app/src/item/entity/item.dart';

class ItemsResponseDTO {

  List<Item>? items;

  ItemsResponseDTO({this.items});

  ItemsResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json['entities'] != null) {
      items = <Item>[];
      json['entities'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
  }

}