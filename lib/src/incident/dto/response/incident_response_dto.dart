import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';

class IncidentResponseDTO {

  final Incident entity;

  const IncidentResponseDTO({
    required this.entity,
  });

  factory IncidentResponseDTO.fromJson(dynamic json) {

    return IncidentResponseDTO(
      entity: Incident.fromJson(json['entity']),
    );
  }
}