import 'package:arruma_ufpr_app/src/incident/entity/incident_interaction.dart';

class IncidentInteractionsResponseDTO {

  List<IncidentInteraction>? incidentInteractions;

  IncidentInteractionsResponseDTO({this.incidentInteractions});

  IncidentInteractionsResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json['entities'] != null) {
      incidentInteractions = <IncidentInteraction>[];
      json['entities'].forEach((v) {
        incidentInteractions!.add(IncidentInteraction.fromJson(v));
      });
    }
  }

}