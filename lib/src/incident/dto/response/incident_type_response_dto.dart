import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';

class IncidentTypeResponseDTO {

  final IncidentType entity;

  const IncidentTypeResponseDTO({
    required this.entity,
  });

  factory IncidentTypeResponseDTO.fromJson(dynamic json) {
    return IncidentTypeResponseDTO(
      entity: IncidentType.fromJson(json['entity']),
    );
  }
}