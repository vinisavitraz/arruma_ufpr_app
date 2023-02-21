import 'package:arruma_ufpr_app/src/location/entity/location.dart';

class LocationResponseDTO {

  final Location entity;

  const LocationResponseDTO({
    required this.entity,
  });

  factory LocationResponseDTO.fromJson(dynamic json) {
    return LocationResponseDTO(
      entity: Location.fromJson(json['entity']),
    );
  }
}