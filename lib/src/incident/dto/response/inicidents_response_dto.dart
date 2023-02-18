import '../../entity/incident.dart';

class IncidentsResponseDTO {

  List<Incident>? incidents;

  IncidentsResponseDTO({this.incidents});

  IncidentsResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json['incidents'] != null) {
      incidents = <Incident>[];
      json['incidents'].forEach((v) {
        incidents!.add(Incident.fromJson(v));
      });
    }
  }

}