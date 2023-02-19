import 'package:arruma_ufpr_app/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/locations_response_dto.dart';

class LocationRepository {

  Future<LocationsResponseDTO> getLocations() async {
    dynamic response = await AppHttpClient.client.get('/location');

    return LocationsResponseDTO.fromJson(response.data);
  }

}