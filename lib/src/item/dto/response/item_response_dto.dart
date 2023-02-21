import 'package:arruma_ufpr_app/src/item/entity/item.dart';

class ItemResponseDTO {

  final Item entity;

  const ItemResponseDTO({
    required this.entity,
  });

  factory ItemResponseDTO.fromJson(dynamic json) {
    return ItemResponseDTO(
      entity: Item.fromJson(json['entity']),
    );
  }
}