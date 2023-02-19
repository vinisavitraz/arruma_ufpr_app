import 'package:arruma_ufpr_app/src/location/entity/location.dart';

class LocationsResponseDTO {

  List<Location>? locations;

  LocationsResponseDTO({this.locations});

  LocationsResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json['entities'] != null) {
      locations = <Location>[];
      json['entities'].forEach((v) {
        locations!.add(Location.fromJson(v));
      });
    }
  }

}