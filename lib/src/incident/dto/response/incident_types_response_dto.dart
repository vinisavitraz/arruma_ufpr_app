import 'package:arruma_ufpr_app/src/incident/entity/incident_type.dart';

class IncidentTypesResponseDTO {

  List<IncidentType>? incidentTypes;

  IncidentTypesResponseDTO({this.incidentTypes});

  IncidentTypesResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json['entities'] != null) {
      incidentTypes = <IncidentType>[];
      json['entities'].forEach((v) {
        incidentTypes!.add(IncidentType.fromJson(v));
      });
    }
  }

}