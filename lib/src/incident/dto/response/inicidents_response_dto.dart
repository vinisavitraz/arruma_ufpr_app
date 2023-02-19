import '../../entity/incident.dart';

class IncidentsResponseDTO {

  List<Incident>? incidents;

  IncidentsResponseDTO({this.incidents});

  IncidentsResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json['entities'] != null) {
      incidents = <Incident>[];
      json['entities'].forEach((v) {
        incidents!.add(Incident.fromJson(v));
      });
    }
  }

}