import 'package:arruma_ufpr_app/src/incident/entity/incident_interaction.dart';

class IncidentInteractionResponseDTO {

  final IncidentInteraction entity;

  const IncidentInteractionResponseDTO({
    required this.entity,
  });

  factory IncidentInteractionResponseDTO.fromJson(dynamic json) {
    return IncidentInteractionResponseDTO(
      entity: IncidentInteraction.fromJson(json['entity']),
    );
  }
}