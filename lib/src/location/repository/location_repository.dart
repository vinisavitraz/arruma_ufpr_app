import 'package:arruma_ufpr_app/src/incident/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/src/location/dto/request/create_location_request_dto.dart';
import 'package:arruma_ufpr_app/src/location/dto/request/update_location_request_dto.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/location_response_dto.dart';
import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/location/dto/response/locations_response_dto.dart';

class LocationRepository {

  Future<LocationsResponseDTO> getLocations() async {
    dynamic response = await AppHttpClient.client.get('/location');

    return LocationsResponseDTO.fromJson(response.data);
  }

  Future<LocationResponseDTO> getLocation(int locationId) async {
    dynamic response = await AppHttpClient.client.get('/location/$locationId');

    return LocationResponseDTO.fromJson(response.data);
  }

  Future<LocationResponseDTO> createLocation(CreateLocationRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.post('/location', data: requestBody);

    return LocationResponseDTO.fromJson(response.data);
  }

  Future<LocationResponseDTO> updateLocation(UpdateLocationRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.put('/location', data: requestBody);

    return LocationResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> deleteLocation(int locationId) async {
    dynamic response = await AppHttpClient.client.delete('/location/$locationId');

    return StatusResponseDTO.fromJson(response.data);
  }

}